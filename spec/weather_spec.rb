require './lib/weather'
require './lib/airport'
require './lib/plane'

describe Weather do

    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    let(:weather) { Weather.new }

    # I asked Helen for some help here on how she set stormy weather
    # describe 'stormy weather' do
    #     it 'stops plane takeoff in stormy weather' do
          
    #     weather = instance_double("Weather", :current_weather => "stormy")
    #     airport.land(plane, weather.current_weather)
    #     expect(airport.hanger.include?(plane)).to eq(false)
    #     end
    # end

end