require './lib/plane.rb'
require './lib/airport.rb'

describe 'land plane' do
  before(:each) do
    @weather_double = double(:weather, stormy?: false)
    @is_airborne = true
    @landed_planes = []
    @airport = Airport.new(weather: @weather_double)
  end

  def land_plane(plane)
    @airport.land(plane) 
    @landed_planes << plane
  end

  it 'should land and take off planes' do
    2.times { 
      plane = Plane.new(@is_airborne)
      land_plane(plane) 
      
      expect(plane.is_airborne).to eq(false)
    }

    expect(@airport.planes).to eq(@landed_planes)

    @landed_planes.each do |plane|
      @airport.take_off(plane)
      expect(plane.is_airborne).to eq(true)
    end

    expect(@airport.planes).to eq([])
  end
end
