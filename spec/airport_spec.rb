require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather)}
  let(:plane) {Plane.new}
  let(:weather) {double :weather, stormy?: false}

  describe 'capacity' do
    it 'has a set default' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can have a specified capacity' do
      airport_2 = Airport.new(weather, 30)
      expect(airport_2.capacity).to eq 30
    end
  end

  describe '#land' do
    before(:each) do
      airport.land(plane)
    end

    it 'stores a plane that has landed' do
      expect(airport.storage).to include(plane)
    end

    it 'raises error if weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {airport.land(plane)}.to raise_error "Storm's a-brewing - Better divert course!"
    end

    it 'raises error if airport is full' do
      full_airport = Airport.new(weather, 0)
      expect {full_airport.land(plane)}.to raise_error "No room at the Inn - Try another airport!"
    end
  end

  describe '#takeoff' do

    it 'releases a plane due for takeoff' do
      airport.takeoff(plane)
      expect(airport.storage.include?(plane)). to eq false
    end

    it 'raises error if weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect {airport.takeoff(plane)}.to raise_error "Storm's a-brewing - Better hold tight!"
    end
  end
end
