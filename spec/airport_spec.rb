require 'airport'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) {double :plane}

  before do
    allow(plane).to receive(:landed)
    allow(plane).to receive(:lift_off)
  end

  describe 'land' do
    it 'tells a plane to land' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe 'take-off' do
    it 'instructs a plane to take-off' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
  end

  describe 'stormy?' do
    it 'stops planes landing' do
      allow(airport).to receive(:stormy?).and_return true
      message = 'Sorry, just too stormy'
      expect{ airport.land(plane) }.to raise_error message
    end

    it 'stops planes taking off' do
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return true
      message = 'Sorry, just too stormy'
      expect{ airport.take_off(plane) }.to raise_error message
    end
  end

  describe 'capacity' do

    it 'has a default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'does not allow planes to land at full airports' do
      described_class::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end
      error = "Airport is full"
      expect{ airport.land(plane) }.to raise_error error
    end

    it 'can be altered on initialization' do
      airport = Airport.new(40)
      described_class::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end
      expect{ airport.land(plane) }.not_to raise_error
    end


  end

end
