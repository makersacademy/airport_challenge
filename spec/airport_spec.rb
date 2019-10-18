require 'airport'

describe Airport do
  it 'is an instance of airport' do
    expect(subject).to be_an_instance_of Airport
  end
  it 'docks planes that have landed' do
    plane = double :plane
    subject.dock plane
    expect(subject.planes.include? plane).to eq true
  end
  it 'gives permission for planes to takeoff' do
    # if permission is granted #get_permission_to_take_off
    # should return index of plane in Airport.planes
    plane = double :plane
    subject.planes = [plane]
    position = subject.get_permission_to_take_off plane
    expect(position).to be_an_instance_of Integer
    expect(position).to be >= 0
  end
end