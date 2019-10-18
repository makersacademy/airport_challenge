require './lib/weather.rb'
require './lib/plane.rb'
require './lib/airport.rb'

describe Weather do
    it 'creates an instance of the weather class' do
        expect(subject).to be_a(Weather)
    end

    it 'creates an array of weather' do
        expect(subject.weather_arr).to include?('sunny')
    end
end