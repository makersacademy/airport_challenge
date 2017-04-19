require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  subject(:airport_2) { described_class.new }
  subject(:airport_3) { described_class.new(30) }
  let(:weather) { double :weather }
  let(:plane) { double :plane }

  describe "capacity" do

    it 'has a default value as initialization' do
      expect(airport.capacity).to eq 20
    end

    it 'can be initialized to a different value' do
      expect(airport_3.capacity).to eq 30
    end

    it 'must be not be assigned with a string at initialization' do
      message = "Capactiy must be an integer"
      expect { described_class.new('string') }.to raise_error message
    end

    it 'must not be assigned with a float at initialization' do
      message = "Capactiy must be an integer"
      expect { described_class.new(1.5) }.to raise_error message
    end

    it 'must have an non-negative value' do
      message = "Capactiy must be greater than zero"
      expect { described_class.new(-1) }.to raise_error message
    end

    it 'makes airport return true for #full? when reached' do
      expect(airport.full?).to eq false
      airport.capacity.times do
        allow(plane).to receive(:land)
        allow(weather).to receive_messages(:status => :sunny)
        plane.land(weather, airport)
        airport.receive(plane)
      end
      expect(airport.full?).to be true
    end

  end

  describe "#release" do

    it 'planes are released from the planes array' do
      allow(plane).to receive(:land)
      airport.receive(plane)
      expect(airport.release(plane)).to eq plane
    end

    it 'cannot release planes that it does not have' do
      message = "Plane is not at that airport"
      expect { airport_2.release(plane) }.to raise_error message
    end

  end

  describe "#receive" do

    it "cannot receive planes when at capacity" do
      airport.capacity.times do
        airport.receive(plane)
      end
      message = "Airport is at capacity"
      expect { airport.receive(plane) }.to raise_error message
    end

  end

  describe "#full?" do

    it 'prevents planes from landing when the airport is full' do
      airport.capacity.times do
        allow(plane).to receive(:land)
        allow(weather).to receive_messages(:status => :sunny)
        plane.land(weather, airport)
        airport.receive(plane)
      end
      message = "Airport is at capacity"
      expect { airport.receive(plane) }.to raise_error message
    end

  end

end
