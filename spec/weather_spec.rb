describe Weather do
		subject(:weather) { described_class.new }

	describe "#stormy?" do
		it 'returns true or false randomly' do
 			expect(weather.stormy?).to be(true).or be(false)
   	end
 	end

 end
