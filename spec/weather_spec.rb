require 'weather'

describe Weather do 

let(:weather) {double :weather}

	 describe '#stormy?' do
	 	it 'returns true when the weather is stormy' do
	 		allow(weather).to receive(:stormy?).and_return true
	 		expect(weather.stormy?).to eq true
	 	end

	 	it 'returns false when the weather is good' do
	 		allow(weather).to receive(:stormy?).and_return false
	 		expect(weather.stormy?).to eq false
	 	end
	 end
end