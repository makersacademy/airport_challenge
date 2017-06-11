describe Weather do
	subject(:weather) { described_class.new }

	describe "#stormy?" do
		it 'returns calm or stormy weather randomly' do
 			expect(weather.stormy?).to eq("calm").or eq("stormy")
   	end
 	end
end
