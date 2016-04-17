require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {double(:plane, flying?: false)}
  let(:airport_capacity_300) {Airport.new(300)}

  describe '#initalize' do
    it 'gets a random weather on initalization' do
      expect(airport.weather == "sunny" || airport.weather == "stormy").to eq(true)
    end
    it 'doesn\'t contain any planes on initalization' do
      expect(airport.planes.length).to eq(0)
    end
    it 'has a default capacity that can be overridden on initalization' do
      expect(Airport::DEFAULT_CAPACITY).to eq(30)
      expect(airport_capacity_300.capacity).to eq(300)
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
