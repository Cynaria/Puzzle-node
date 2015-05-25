describe Word do
	let(:word) {Word.new("hi")}
	describe '#calc_word_value' do
		it 'Calculates the word value' do
			tiles = Parser.create_tiles('./ex_in.json')
			expect(word.calc_word_value("hi")).to eq(12)
		end
	end

	describe '#split_word' do
		it 'splits the word' do
			expect(word.split_word).to eq(["h","i"])
		end
	end

	describe '#map_word_tiles' do
		expect()
	end
end