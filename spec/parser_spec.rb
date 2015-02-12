require_relative "spec_helper"
describe Parser do
	describe "#create_hash" do
		let(:file) {"ex_in.json"}
		it "parses a JSON file" do
			expect(Parser.create_hash(file)["board"]).to include("1 1 1 1 1 1 1 1 1 1 1 1")
		end
	end
end