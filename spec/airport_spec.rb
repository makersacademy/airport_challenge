require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  # it 'should instruct a plane to land at an aiport' do
  #   expect(@airport.instruct_to_land(@plane)).to eq true
  # end
  #
  # it 'should instruct a plane to take off at an airport' do
  #   expect(@airport.instruct_to_take_off(@plane)).to eq true
  # end

  it 'should add a plane to the array when it lands' do
    @airport.land_plane(@plane)
    expect(@airport.planes_in_airport).to eq([@plane])
  end

  it 'should contain an array of the planes in the airport' do
    @airport.land_plane(@plane)
    expect(@airport.planes_in_airport).to eq([@plane])
  end

  it 'should remove a plane from array when instructed to take off and confirm this has been done' do
    @airport.land_plane(@plane)
    @airport.take_off(@plane)
    expect( @airport.take_off(@plane)).to eq "#{@plane} has now left airport"
  end



end
