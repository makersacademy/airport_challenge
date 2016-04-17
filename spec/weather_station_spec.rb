require 'weather_station'

describe WeatherStation do
	let(:weather) { described_class.new }

	it 'poor weather should be true for randmonly generated value of 40' do
	allow(weather).to receive(:random).and_return(40)
	expect(weather.poor_weather?).to eq true
	end

	it 'poor weather should be false for randmonly generated value of 60' do
	allow(weather).to receive(:random).and_return(60)
	expect(weather.poor_weather?).to eq false
	end

end