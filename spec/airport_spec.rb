require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather)}
  let(:plane) {Plane.new}
  let(:weather) {double :weather, stormy?: false}

  describe '#land' do
    before(:each) do
      airport.land(plane)
    end

    it 'stores a plane that has landed' do
      expect(airport.storage).to include(plane)
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
