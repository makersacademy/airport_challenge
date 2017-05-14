require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'should have a default capacity of 10 when instantiated with no arguments' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should allow user to specify a capacity when creating a new airport' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it 'should allow user to override airport capacity' do
    expect(airport.capacity = 30).to eq 30
  end

  it 'should indicate that airport is full' do
    allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect(airport.full?).to eq true
  end

  it 'should prevent a plane from landing if the weather is stormy' do
    allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return true
    expect{airport.land(plane)}.to raise_error "Unable to land plane - weather is stormy"
  end

  it 'should allow a plane to land if the weather is clear' do
    allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.instance_variable_get(:@planes)).to eq [plane]
  end

  it 'should raise an exception when plane tries to take off from an airport it is not at' do
    airport.instance_variable_set(:@planes, [])
    expect{ airport.take_off(plane) }.to raise_error "Plane is not at that airport"
  end

end
