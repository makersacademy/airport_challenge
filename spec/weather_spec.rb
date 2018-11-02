require 'weather'

describe Weather do
	let(:weather) {weather = Weather.new}

	describe '#generate_weather' do
		it 'generates a random state of weather' do
			expect(weather).to respond_to(:generate_weather)
		end
	end
end