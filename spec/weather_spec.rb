require './lib/weather.rb'
require './lib/plane.rb'
require './lib/airport.rb'

describe Weather do
    it 'creates an instance of the weather class' do
        weather = Weather.new
        expect(weather).to be_a(Weather)
    end
end