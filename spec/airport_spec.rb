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
  it 'raises error if docked plane tries to dock again' do
    plane = double :plane
    expect {
      2.times do
        subject.dock plane
      end
    }.to raise_error 'Plane is already docked'
  end
  it 'raises error if non-docked plane asks for takeoff permission' do
    expect {
      subject.get_permission_to_take_off double(:plane)
    }.to raise_error 'Plane is not docked'
  end
  it 'gives permission for planes to takeoff' do
    # if permission is granted #get_permission_to_take_off
    # should return index of plane in Airport.planes
    plane = double :plane
    subject.planes = [plane]
    subject.weather = 'sunny'
    position = subject.get_permission_to_take_off plane
    expect(position).to be_an_instance_of Integer
    expect(position).to be >= 0
  end
  it 'it does not give take of permission if weather is stormy' do
    plane = double :plane
    subject.planes = [plane]
    subject.weather = 'stormy'
    expect(subject.get_permission_to_take_off plane).to eq nil
  end
end
