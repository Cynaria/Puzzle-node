require_relative "../app.rb"
class Board
	attr_reader :squares
	def initialize
		@squares = Parser.create_squares('./ex_in.json')
		@row_length = row_length
		@column_length = column_length
	end

	def row_length
		column(0).length
	end

	def column_length
		row(0).length
	end

	def rows
		rows = []
		row_length.times do |r|
			rows << self.row(r)
		end
		rows
	end

	def columns
		columns = []
		column_length.times do |c|
			columns << self.column(c)
		end
		columns
	end

	def row(num)
		Square.find_by(:row, num).sort_by {|s| s.column}
	end

	def column(num)
		Square.find_by(:column, num).sort_by {|s| s.row }
	end

	def calculate_square_values(word)
		word_length = word.length
	end

	def assign_best_pos(word)
		word_pos = best_word_pos(word)
		word_text = word.text
		square = word_pos["start_square"]

		word_text.split("").each do |l|
			tile = Tile.find_tile(l)
			square.add_tile(tile)
			square = advance_square(square, word_pos["direction"])
		end
	end

	def advance_square(square, direction)
		if direction == "row"
			Square.find_by(:column, square.column + 1).find {|s| s.row == square.row}
		else
			Square.find_by(:column, square.row + 1)
		end
	end

	def best_word_pos(word)
		best_col = best_col_pos(word)
		best_row = best_row_pos(word)
		best_col["highest_score"] > best_row["highest_score"] ? best_col : best_row
	end

	def best_col_pos(word)
		word_values = word.tile_values
		word_length = word_values.length
		highest_score = 0
		start_square = nil

		self.columns.each do |column|
		  column.each_with_index do |s, i|
			  unless i + word_length > column.length 
					index = 0
			    calc_word_col = []
			    column[i.. i+word_length-1].map do |v|
				    calc_word_col << word_values[index] * v.multiplier
				    index += 1
			    end

			    reduced = calc_word_col.reduce(:+)

			    if reduced > highest_score
				    highest_score = reduced
				    start_square = s
			    end
			  end
		  end
		end
		{"highest_score" => highest_score,
		 "start_square" => start_square,
		 "direction" => "col"
		}	
	end

	def best_row_pos(word)
		word_values = word.tile_values
		word_length = word_values.length
		highest_score = 0
		start_square = nil

		self.rows.each do |row|
		  row.each_with_index do |s, i|
			  unless i + word_length > row.length 
					index = 0
			    calc_word_row = []
			    row[i.. i+word_length-1].map do |v|
				    calc_word_row << word_values[index] * v.multiplier
				    index += 1
			    end

			    reduced = calc_word_row.reduce(:+)

			    if reduced > highest_score
				    highest_score = reduced
				    start_square = s
			    end
			  end
		  end
		end
		{"highest_score" => highest_score,
		 "start_square" => start_square,
		 "direction" => "row"
		}
	end

	def display
		display_board = self.rows.map do |row|
			row.map do |square|
				if square.tile
					square.tile.letter
				else
					square.multiplier
				end
			end
		end

		display_board.each { |row| puts row.join(" ") }

	end

end