require_relative "spec_helper.rb"
describe Dictionary do
	let(:dictionary) {Dictionary.new()}
	describe "#new" do
		it "creates an array of word objects" do
			tiles = Parser.create_tiles('./ex_in.json')
			expect(dictionary.words[0]).to be_an_instance_of Word
		end
	end

	describe "#check_word" do
		context "dictionary contains word" do
			it "returns the word" do
				expect(dictionary.check_word("gyre").text).to eq("gyre")
			end
			it "does not contain word" do
				expect(dictionary.check_word("foo")).to be(nil)
			end
		end
	end

	describe '#highest_valued_word' do
		it 'returns highest valued word' do
			expect(dictionary.highest_valued_word.text).to eq("whiffling")
		end
	end
end