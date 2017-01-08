require 'weather'

describe Weather do 

	 describe '#stormy?' do
	 	it 'returns truw when the weather is stormy' do
	 		weather = double(:weather)
	 		allow(weather).to receive(:stormy?).and_return true
	 		expect(weather.stormy?).to eq true
	 	end

	 	it 'returns false when the weather is good' do
	 		weather = double(:weather)
	 		allow(weather).to receive(:stormy?).and_return false
	 		expect(weather.stormy?).to eq false
	 	end
	 end
end