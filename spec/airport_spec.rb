require 'airport'

describe Airport do
  it 'responds to instruct_to_land method' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end
  it 'responds to landed_planes method' do
    expect(subject).to respond_to(:landed_planes)
  end
  it 'should return array if land_planes method is called on it' do
    expect(subject.landed_planes.class).to eq Array
  end
  it 'should be initialized as an empty airport, i.e. landed_planes is empty' do
    expect(subject.landed_planes.empty?).to eq true
  end
  it 'should store the landed plane if a plane is instructed to land' do
    plane = Plane.new
    airport = subject
    airport.instruct_to_land(plane)
    expect(airport.landed_planes[-1]).to eq plane
  end
  it 'should respond to instruct_to_take_off' do
    expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
  end
end
