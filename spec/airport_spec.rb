require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather, :stormy => true }

  #instructs the plane to land and confirm it has landed
  before do
    allow(plane).to receive(:land)
  end
    it {expect(airport).to respond_to(:land).with(1).argument}
    it 'confirms the plane is at that airport once landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

  #instructs the plane to take off and confirm no longer at airport
  before do
    allow(plane).to receive(:take_off)
  end
    it {expect(airport).to respond_to(:take_off).with(1).argument}
    it 'confirms the plane is not at that airport once taken off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to_not include plane
    end

  it 'will not let plane take off if stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    msg = "too stormy to take off"
    expect{airport.take_off(plane)}.to raise_error(msg)
  end

end
