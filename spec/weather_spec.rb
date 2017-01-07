require 'weather'

describe Weather do 

	describe '#stormy?' do
		it 'reports whether the weather is stormy' do
			weather = double("weather")
			allow(weather).to receive(:stormy?).and_return true
			expect(weather.stormy?).to eq true
			allow(weather).to receive(:stormy?).and_return false
			expect(weather.stormy?).to eq false
		end
	end
end