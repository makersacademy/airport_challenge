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
  it 'should release the plane from @landed_planes as soon #instruct_to_take_off is called with that plane as argument' do
    plane = Plane.new
    airport = subject
    airport.instruct_to_land(plane)
    airport.instruct_to_take_off(plane)
    expect(airport.landed_planes.include?(plane)).to eq false
  end
  it 'should respond to #weather' do
    expect(subject).to respond_to(:weather)
  end
  it 'should be initialized with a Weather object in @weather' do
    expect(subject.weather.class).to eq Weather
  end
  it 'should raise an error if a plane is instructed at stormy weather' do
    airport = Airport.new # should be a double with bad weather later on
    plane = Plane.new # should be a double later on
    expect{airport.instruct_to_land(plane)}.to raise_error(RuntimeError, "The weather is stormy. Landing not allowed.")
  end
end
