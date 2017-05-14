require 'airport'

describe Airport do
  subject(:airport) { described_class.new("LHR")}

  # Airport Default Capacity
  DEFAULT_AIRPORT_CAPACITY = 40

  it { is_expected.to respond_to(:planes_on_ground) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(2).argument }
  it { is_expected.to respond_to(:iata_code)}
  it { is_expected.to respond_to(:stormy?)}
  it { is_expected.to respond_to(:full?)}
  
  
  context 'defaults' do
    subject(:default_airport) { described_class.new("LIS") }
    it 'gets a default capacity' do
      expect(default_airport.capacity).to eq DEFAULT_AIRPORT_CAPACITY
    end
  end

  context 'overrides' do
    # Override Airport Capacity
    OVERRIDE_CAPACITY = 150
    subject(:default_airport) { described_class.new("LHR",OVERRIDE_CAPACITY) }
    it 'allow creating an airport with a capacity override' do
      expect(default_airport.capacity).to eq OVERRIDE_CAPACITY
    end
  end

  describe '#land_plane' do
    it 'it instructs plane to land and register arrival' do
      plane = Plane.new("G-ZBKP")
      allow(airport).to receive(:stormy?).and_return false
      airport.land_plane(plane)
      expect(airport.planes_on_ground).to eq [plane.tail_number]
    end

    it 'raises an error if the weather is stormy' do
      plane = Plane.new("G-ZBKP")
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land_plane(plane) }.to raise_error 'Operation aborted: Weather is stormy'
    end
  end

  describe '#takeoff_plane' do
    it 'it instructs plane to take off and register departure by removing it from the list of planes on ground' do
      plane = Plane.new("G-ZBKP")
      allow(airport).to receive(:stormy?).and_return false
      airport.land_plane(plane)
      destination = Airport.new("LIS")
      allow(airport).to receive(:stormy?).and_return false
      airport.takeoff_plane(plane, destination)
      expect(airport.planes_on_ground).not_to eq [plane.tail_number]
    end

    it 'raises an error if the weather is stormy' do
      plane = Plane.new("G-ZBKP")
      destination = Airport.new("LIS")
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.takeoff_plane(plane, destination) }.to raise_error 'Operation aborted: Weather is stormy'
    end
  end

  describe '#stormy?' do
    it 'can return true or false, depending on weather' do
      expect(airport.stormy?).to be(true).or be(false)
    end
  end

end