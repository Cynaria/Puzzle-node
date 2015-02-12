require_relative "./app.rb"
require 'json'
class Parser

	def self.create_hash(file)
		file = Parser.file_read(file)
		JSON.parse(file)
	end

	def self.file_read(file)
		File.read(file)
	end

end

