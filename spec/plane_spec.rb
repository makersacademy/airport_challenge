require 'plane'
require 'airport'

describe Plane do
  # successful instantiate plane
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Plane)
  end

  it 'docks, and has dock_status as true' do
    expect(subject).to respond_to(:dock)
    subject.dock
    expect(subject.dock_status).to equal(true)
  end

  it 'undocks, and has dock_status as false' do
    expect(subject).to respond_to(:undock)
    subject.dock
    subject.undock
    expect(subject.dock_status).to equal(false)
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
