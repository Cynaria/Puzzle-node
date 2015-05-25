require_relative "../app.rb"
class Square
	attr_reader :multiplier, :row, :column
	attr_accessor :tile, :changeable
	def initialize(multiplier, row, column)
		@multiplier = multiplier
		@row = row
		@column = column
		@tile = nil
		@changeable = true
	end

	def add_tile(tile)
		self.tile = tile
		tile.use_tile
		set_square
	end

	def set_square
		@changeable = false
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

	def self.find_by(attr, value)
		self.all.find_all {|s| s.send(attr) == value }
	end

end