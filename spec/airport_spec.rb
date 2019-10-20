require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe "#land" do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "confirms that plane has landed" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to eq "landed"
    end

    context "when stormy" do
      it "prevents 'landing' when weather is stormy" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land: weather is stormy"
      end
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "confirms that plane is no longer in the airport" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.take_off(plane)).to eq "taken off"
    end

    context "when stormy" do
      it "prevents takeoff when weather is stormy" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Cannot takeoff: weather is stormy"
      end
    end
  end
end
