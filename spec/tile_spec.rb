describe Tile do
	describe "#find_tile" do
		it "should return the correct tile" do
			expect(Tile.find_tile("h").first.value).to eq(8)
		end
	end
end