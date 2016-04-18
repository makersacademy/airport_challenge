require 'airport'

describe Airport do
  let(:airport) {described_class.new}
  let(:plane) {double(:plane, flying?: false)}

  describe '#initalize' do
    it 'sets weather to "sunny" on initalization' do
      expect(airport.weather == "sunny").to eq(true)
    end
    it 'doesn\'t contain any docked planes on initalization' do
      expect(airport.planes.length).to eq(0)
    end
  end

  describe '#capacity?' do
    context 'it can be overriden' do
      it 'Default capacity is overridden' do
        airport.capacity = 3000
        expect(Airport::DEFAULT_CAPACITY).not_to eq(airport.capacity)
      end
    end
  end

  describe '#full?' do
    it 'returns true if nr of planes equals capacity' do
      airport.capacity.times { |plane| airport.planes << plane }
      expect(airport.full?).to eq(true)
    end
  end

  describe '#dock(plane)' do
    it 'airport docks the plane' do
      planes_before = airport.planes.length
      airport.dock(plane)
      expect(airport.planes.length == (planes_before + 1)).to eq true
    end
    it 'raises an exception if it tries to dock a flying plane' do
      allow(plane).to receive(:flying?).and_return true
      expect{ airport.dock(plane) }.to raise_exception "Can't dock a flying plane"
    end
    it 'raises an exception if it tries to dock a plane thats already docked' do
      allow(airport).to receive(:planes).and_return [plane]
      expect{ airport.dock(plane) }.to raise_exception "Can't dock plane twice"
    end
  end

  describe '#undock(plane)' do
    it 'airport undocks the plane' do
      airport.dock(plane)
      airport.undock(plane)
      expect(airport.planes.include?(plane)). to eq false
    end
    it 'raises an exception if it tries to undock a flying plane' do
      allow(plane).to receive(:flying?).and_return true
      expect{ airport.undock(plane) }.to raise_exception "Can't undock a plane that is not here"
    end
  end

end
