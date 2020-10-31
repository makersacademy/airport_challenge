require 'airport'
require 'plane'
describe Airport do

  it 'responds to land method' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off method' do
    expect(subject).to respond_to :take_off
  end
end

describe '#land' do
  airport = Airport.new

  it 'lands a plane' do
    expect(airport.land).to be_instance_of Plane
  end
end

describe '#take_off' do
  airport = Airport.new
  plane = Plane.new

  it 'allows user to instruct a plane' do
    expect(plane).to be_instance_of Plane
  end

  it 'confirms the plane is in the air' do
    airport.land
    expect(airport.take_off).to eq "The plane is in the air"
  end
end
