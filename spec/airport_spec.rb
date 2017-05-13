require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

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

  it 'should prevent a plane from landing if the weather is stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect{airport.land(plane)}.to raise_error "Unable to land - weather is stormy"
  end

  it 'should allow a plane to land if the weather is clear' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.instance_variable_get(:@planes)).to eq [plane]
  end

end
