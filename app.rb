require_relative "./lib/parser.rb"
require_relative "./lib/tile.rb"
require_relative "./lib/board.rb"
require_relative "./lib/word.rb"
require_relative "./lib/square.rb"
require_relative "./lib/dictionary.rb"

board = Board.new
dictionary = Dictionary.new
board.assign_best_pos(dictionary.highest_valued_word)
board.display