require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  #instructs the plane to land and confirm it has landed
  before do
    allow(plane).to receive(:land)
  end
    it { expect(airport).to respond_to(:land).with(1).argument }
    it 'confirms the plane is at that airport once landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

  #instructs the plane to take off and confirm no longer at airport
  before do
    allow(plane).to receive(:take_off)
  end
    it { expect(airport).to respond_to(:take_off).with(1).argument }
    it 'confirms the plane is not at that airport once taken off' do
      airport.take_off(plane)
      expect(airport.planes).to_not include plane
    end

end
