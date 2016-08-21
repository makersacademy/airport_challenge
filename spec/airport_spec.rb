require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather}

  context "weather is fine for these examples" do
    before do
      allow(airport).to receive(:weather_check).and_return(nil)
      allow(plane).to receive(:plane_landed)
      allow(plane).to receive(:plane_taking_off)
    end
  #instructs the plane to land and confirm it has landed
    it {expect(airport).to respond_to(:land).with(1).argument}
    it 'confirms the plane is at that airport once landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

  #instructs the plane to take off and confirm no longer at airport
    it {expect(airport).to respond_to(:take_off).with(1).argument}
    it 'confirms the plane is not at that airport once taken off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to_not include plane
    end
  end

  context "weather is stormy for these examples" do
    before do
      allow(airport).to receive(:weather_check).and_return("stormy")
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
end
