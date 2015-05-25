require_relative "../app.rb"
class Word
	attr_reader :text, :word_value
	def initialize(text)
		@text = text
		@word_value ||= calc_word_value
	end

	def calc_word_value
		self.tile_values.reduce(:+)
	end

	def split_word
		self.text.split("")
	end

	def map_word_tiles
		self.split_word.map { |l| Tile.find_tile(l) }
	end

	def tile_values
		self.map_word_tiles.map { |v| v.value }
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

end
