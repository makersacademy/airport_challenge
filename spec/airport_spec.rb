require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  subject(:airport_2) { described_class.new }
  subject(:airport_3) { described_class.new(30) }
  let(:weather) { double :weather }
  let(:plane) { double :plane }

  it 'cannot reports full when at capacity' do
    expect(airport.full?).to eq false
    airport.capacity.times do
      plane = double('plane', :land => true)
      allow(weather).to receive_messages(:status => :sunny)
      plane.land(weather, airport)
      airport.receive(plane)
    end
    expect(airport.full?).to eq true
  end

  it 'responds to capacity' do
    expect(airport).to respond_to :capacity
  end

  it 'responds to receive' do
    expect(airport).to respond_to :receive
  end

  it 'responds to release' do
    expect(airport).to respond_to :release
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq 20
  end

  it 'can have capacity overridden' do
    expect(airport_3.capacity).to eq 30
  end

  it 'cannot release planes that it does not have' do
    message = "Plane is not at that airport"
    expect { airport_2.release(plane) }.to raise_error message
  end

  it 'planes are released from the planes array' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(plane).to receive(:land)
    plane.land(weather, airport)
    airport.receive(plane)
    expect(airport.release(plane)).to eq plane
  end

  it 'prevents landing when the airport is full' do
    allow(weather).to receive_messages(:status => :sunny)
    allow(airport).to receive_messages(:full? => true)
    message = "Airport is at capacity"
    expect {  airport.receive(plane) }.to raise_error message
  end

end
