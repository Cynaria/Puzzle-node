require_relative "../app.rb"
class Tile
	attr_reader :letter, :value
	attr_accessor :used
	def initialize (tile)
		@letter = tile[0]
		@value = tile[1..-1].to_i
		@used = false
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

	def self.find_tile(l)
		self.all.find{|t| t.letter == l}
	end

	def use_tile
		self.used = true
	end

end