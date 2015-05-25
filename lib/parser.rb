require_relative "../app.rb"
require 'json'

class Parser

	def self.create_hash(f)
		file ||= Parser.file_read(f)
		JSON.parse(file)
	end

	def self.file_read(f)
		file ||= File.read(f)
	end

	def self.create_tiles(file)
		self.create_hash(file)["tiles"].map {|tile| Tile.new(tile)}
	end

	def self.create_words(file)
		self.create_hash(file)["dictionary"].map! {|word| Word.new(word)}
	end

	def self.create_squares(file)
		board = self.nested_arr_pos_val(self.create_hash(file)["board"])
		board.map! {|square| Square.new(square[0].to_i, square[1], square[2])}
	end

	def self.nested_arr_pos_val(arr)
		pos_arr = []
		x = 0

		arr.map!{ |r| r.split(" ")}.each do |h| 
			y = 0 
			h.each do |v| 
				pos_arr << [v,x,y]
				y += 1
			end
			x += 1 
		end
		pos_arr
	end

end

