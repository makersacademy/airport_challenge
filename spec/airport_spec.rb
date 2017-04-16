require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  subject(:airport_2) { described_class.new }
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

  it 'has a planes array' do
    expect(airport).to respond_to :planes
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
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end

  it 'receives landing planes into its planes array' do
    allow(plane).to receive_messages(:land => :landed)
    allow(weather).to receive_messages(:status => :sunny)
    plane.land(weather, airport)
    airport.receive(plane)
    expect(airport.planes.count).to eq 1
  end

  it 'releases departing planes from its planes array' do
    allow(plane).to receive_messages(:take_off => :in_air, :land => true)
    allow(weather).to receive_messages(:status => :sunny)
    airport.receive(plane)
    expect(airport.planes.count).to eq 1
    plane.take_off(weather, airport)
    airport.release(plane)
    expect(airport.planes.count).to eq 0
  end

  it 'cannot release planes that it does not have' do
    message = "Plane is not at that airport"
    expect { airport_2.release(plane) }.to raise_error message
  end

end
