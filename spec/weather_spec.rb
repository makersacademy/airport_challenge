require 'weather'

describe Weather do
	let(:weather) {weather = Weather.new}
	# All tests set up with generate_weather producing storms at 33% of time

	describe '#generate_weather' do
		it 'generates a random state of weather' do
			expect(weather.generate_weather).to eq("sunny") | eq("stormy")
		end
	end

	describe '#generate_weather' do
		it 'generates sunny weather' do
			expect(weather.generate_weather(10)).to eq("sunny")
		end
	end

	describe '#generate_weather' do
		it 'generates stormy weather' do
			expect(weather.generate_weather(3)).to eq("stormy")
		end
	end
end