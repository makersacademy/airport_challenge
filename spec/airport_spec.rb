require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  before do
    allow(airport.weather).to receive(:stormy?) {false}
  end

  describe "#initialize" do
    it 'defaults capacity' do
      expect( airport.capacity ).to eq Airport::DEFAULT_CAPACITY
    end

    it 'overrides default capacity at initialization' do
      n = (0..1000)
      airport = Airport.new(n)
      expect( airport.capacity ).to eq n
    end
  end

  describe '#land' do
    it 'allows planes to land' do
      expect(airport.land(plane)).to eq [plane]
    end

    it 'does not allow landed planes to land again' do
      airport.land(plane)
      expect{ airport.land(plane) }.to raise_error "This plane has already landed"
    end

    it 'has the plane after landing' do
      airport.land(plane)
      expect(airport.landing_strip).to include plane
    end

    it 'raises error if airport is full' do
      (0..airport.capacity).each {|x| airport.landing_strip << x}
      expect{ airport.land(plane) }.to raise_error "The airport is full. You must land somewhere else"
    end

    it 'raises error if weather is too stormy for landing' do
      allow(airport.weather).to receive(:stormy?) {true}
      expect{ airport.land(plane) }.to raise_error "The weather is too stormy. You cannot land now."
    end

  end

  describe "#take_off" do
    it 'allows planes to take off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end

    it 'does not allow airborne planes to take off again' do
      airport.land(:another_plane)
      expect{ airport.take_off(plane)}.to raise_error "This plane is already airborne"
    end

    it 'does not have the plane after take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landing_strip).not_to include plane
    end

    it 'raises error if airport is empty' do
      expect{ airport.take_off(plane)}.to raise_error "There are no planes here"
    end

    it 'raises error if weather is too stormy for take off' do
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?) {true}
      expect{ airport.take_off(plane) }.to raise_error "The weather is too stormy for take off"
    end
  end

end
