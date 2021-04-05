require 'plane'
require 'airport'

describe Plane do
  # successful instantiate plane
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Plane)
  end
  ## successful plane.is_in_airport == false
  #it 'is not in airport on instantiation' do
  #  expect(subject).not_to be_in_airport
  #end

  # # responds to land method
  # it 'lands' do
  #   expect(subject).to respond_to(:land)
  # end
  # # plane.land == plane_is_in_airport
  # it 'when landed, is in_airport' do
  #   subject.land
  #   # first_airport = Airport.new
  #   expect(subject.in_airport?).to be(true)
  # end
end
