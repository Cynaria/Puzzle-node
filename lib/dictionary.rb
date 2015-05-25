require_relative "../app.rb"
class Dictionary
	attr_reader :words
	def initialize
		@words = Parser.create_words('./ex_in.json')
	end

	def check_word(word)
		@words.find {|w| w.text == word }
	end

	def highest_valued_word
		words.sort_by { |w| w.word_value }.last
	end
end