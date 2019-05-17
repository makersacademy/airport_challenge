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
          
    #     weather = instance_double("Weather", :state_of_weather => "stormy")
    #     airport.landing_plane(plane, weather.state_of_weather)
    #     expect(airport.airport_store.include?(plane)).to eq(false)
        
    #     end

end