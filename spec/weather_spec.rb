require './lib/weather.rb'
require './lib/plane.rb'
require './lib/airport.rb'

describe Weather do
    it 'creates an instance of the weather class' do
        expect(subject).to be_a(Weather)
    end

    it 'creates an array of weather' do
        expect(subject.weather_arr).to include('Sunny')
    end

    describe '#set_weather' do
        it 'returns one item in the array at random' do
            expect(['Sunny', 'Stormy', 'Raining', 'Cloudy']).to include(subject.set_weather)
        end
    end
end