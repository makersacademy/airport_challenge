require 'weather'

describe Weather do
	let(:weather) {weather = Weather.new}

	describe '#generate_weather' do
		it 'generates a random state of weather' do
			expect(weather.generate_weather).to eq("sunny") | eq("stormy")
		end
	end

	describe '#generate_weather' do
		it 'generates sunny weather' do
			allow(weather).to receive(:generate_weather) {"sunny"}
		end
	end

	describe '#generate_weather' do
		it 'generates stormy weather' do
			allow(weather).to receive(:generate_weather) {"stormy"}
		end
	end
end