describe Weather do
	subject(:weather) { described_class.new }
	describe "weather_type" do
		it 'returns calm or stormy weather randomly' do
 			expect(subject.weather_type).to eq("calm").or eq("stormy")
   	end
 	end
end
