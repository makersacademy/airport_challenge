require 'airport.rb'
describe Airport do
# check method land_plane responds to Airport
  it { is_expected.to respond_to(:land_plane) }
  
# check that land_plane has one argument(plane)
  it { is_expected.to respond_to(:land_plane).with(1).argument }

# check that a plane can land at the airport
#  it 'plane should land at airport' do
#    expect(land_plane(plane)).to include(plane)
#  end
    
# check that takeoff_plane responds to Airport
  it { is_expected.to respond_to(:takeoff_plane) }

# check that takeoff_plane has one argument(plane)
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument }

end
