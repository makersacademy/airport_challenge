require 'airport'
require 'plane'
require 'weather'

describe Weather do

    let(:airport) { Airport.new { include Weather } }

    it 'lets an airport get the weather' do 
        expect(airport).to respond_to(:get_weather)
    end 

    it 'returns Stormy or Sunny' do 
        expect(airport.local_weather).to eq("Stormy").or eq("Sunny")
    end 

end 