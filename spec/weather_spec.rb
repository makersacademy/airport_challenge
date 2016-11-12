require 'weather'

describe Weather do

	subject(:weather) {described_class}
	
	it 'expects random number 0 to return "stormy"' do
		allow(weather).to receive(:random_number) { 0 }
		expect(weather.check_weather).to eq "stormy"
	end
	
	it 'expects random number 1 to return "sunny"' do
		allow(weather).to receive(:random_number) { 1 }
		expect(weather.check_weather).to eq "sunny"
	end

end