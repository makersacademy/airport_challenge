require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  let(:plane) { double (:plane) }
  let(:weather) { double (:weather) }

  it 'has an Airport class' do
    expect(airport).to be_a(Airport)
  end

  it 'has a constant CAPACITY with a default value of 5' do
    expect(Airport::CAPACITY).to eq(5)
  end

  it 'can specify the value of CAPACITY when an Airport is instantiated' do
    test_capacity = rand(10) + 1
    test_airport = Airport.new(test_capacity)
    expect(test_airport.capacity).to eq(test_capacity)
  end

  it 'can alter CAPACITY as needed (post-instantiation)' do
    new_capacity = 10
    airport.set_capacity(new_capacity)
    expect(airport.capacity).to eq(new_capacity)
  end

  it 'has an array to store planes' do
    expect(airport.instance_variable_get(:@stored_planes)).to be_a(Array)
  end

  it 'can display stored planes array' do
    expect(airport.instance_variable_get(:@stored_planes)).to eq(airport.stored_planes)
  end

  it "can call 'take_off' with an arguement" do
    expect(airport).to respond_to(:take_off).with(2).argument
  end

  it 'stores planes that land' do
    (airport.stored_planes) << plane
    expect(airport.stored_planes.pop).to eq (plane)
  end

  it 'removes a plane from stored_planes once it takes off' do
    (airport.stored_planes) << plane
    allow(plane).to receive(:in_flight) { false }
    allow(weather).to receive(:stormy?) { false }
    allow(plane).to receive(:flight_status)
    airport.take_off(plane, weather)
    expect(airport.stored_planes.length).to eq(0)
  end

  it 'can only remove planes that are at the airport' do
    allow(plane).to receive(:in_flight) { false }
    expect{airport.take_off(plane, weather)}.to raise_error('Plane not at airport')
  end

  it 'can only take off when weather isn\'t stormy' do
    allow(weather).to receive(:stormy?) { true }
    allow(plane).to receive(:in_flight) { false }
    (airport.stored_planes) << plane
    expect{airport.take_off(plane, weather)}.to raise_error('Weather is stormy: unsafe to take off')
  end

  it 'cannot take off if already in flight' do
    allow(plane).to receive(:in_flight) { true }
    expect{airport.take_off(plane, weather)}.to raise_error('Plane already in flight')
  end

end
