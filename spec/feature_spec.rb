require 'airport_controller'
require 'plane'
require 'airport'
require 'weather'

describe 'Lands and takes off a number of planes' do
  
  before(:all) do 
    class MockRandom
      def rand(_num)
        42
      end
    end
    rng = MockRandom.new
    weather = Weather.new(rng)
    @airport_controller = AirportController.new(weather)
    @heathrow = Airport.new
    @gatwick = Airport.new(30)
    @planes = []
  end

  it 'create number of planes' do
    @planes << Plane.new
    @planes << Plane.new
    @planes << Plane.new
    expect(@planes.map do |plane|
      plane.location == Plane::AIRBORN
    end).to all be true
  end

  it 'land all @planes in Heathrow' do
    @planes.each do |plane|
      @airport_controller.instruct_plane_to_land(plane, @heathrow)
    end
    expect(@planes.map do |plane|
      plane.location == @heathrow
    end).to all be true
  end

  it 'take off a plane from Heathrow' do
    @airport_controller.instruct_plane_to_take_off(@planes[0], @heathrow)
    expect(@planes[0].location).to eq Plane::AIRBORN
  end

  it 'land a plane to Gatwick' do
    @airport_controller.instruct_plane_to_land(@planes[0], @gatwick)
    expect(@planes[0].location).to eq @gatwick
  end

  it 'take off another plane from Heathrow' do
    @airport_controller.instruct_plane_to_take_off(@planes[1], @heathrow)
    expect(@planes[1].location).to eq Plane::AIRBORN
  end

end
