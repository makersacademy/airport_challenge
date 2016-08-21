require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather}

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

  #weather is stormy for these tests
  before do
    allow(weather).to receive(:stormy?).and_return(true)
  end

  it 'tests that double is returning stormy is true correctly' do
    w = Weather.new
    allow(w).to receive(:stormy?).and_return(true)
    expect(w.stormy?).to eq true
  end

  it 'will not let plane take off if stormy' do
    msg = "too stormy to take off"
    expect{airport.take_off(plane)}.to raise_error(msg)
  end

  it 'will not let plane land if stormy' do
    msg = "too stormy to land"
    expect{airport.land(plane)}.to raise_error(msg)
  end

end
