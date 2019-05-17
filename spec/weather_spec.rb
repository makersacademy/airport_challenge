require './lib/weather'
require './lib/airport'
require './lib/plane'

describe Weather do

    describe 'stormy weather' do
        it 'stops plane takeoff in stormy weather' do
          weather = Weather.new
          weather.conditions 
          expect{ weather.conditions }.to raise_error("We can't take off in stormy weather")
        end
    end

end