require 'airport'

describe 'Airport' do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  let(:weather) {Weather.new}

  context "good weather" do

    it "return plane landed" do
      allow(airport).to receive(:stormy?) { false }
      expect(airport.land(plane)).to eq [plane]
    end
    it "return plane took off" do
      allow(airport).to receive(:stormy?) {false}
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it "raises error when hanger is full" do
        allow(airport).to receive(:stormy?) { false }
        allow(airport).to receive(:full?) { true }
        expect {airport.land(plane).to raise_error "full"}
    end
    it "raises error when plane is not in hanger" do
      allow(airport).to receive(:stormy?) { false }
      expect {airport.take_off(plane)}.to raise_error "plane not in the hanger"
    end
    it "raises error when plane already in the hanger" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect {airport.land(plane)}.to raise_error "plane already in the hanger"
      end

  end

  context "stormy weather" do

    it "raises error when stormy to land" do
      allow(airport).to receive(:stormy?) { true }
      expect {airport.land(plane).to raise_error "stormy"}
    end
    it "raises error when stormy to take off" do
      allow(airport).to receive(:stormy?) { true }
      expect {airport.take_off(plane).to raise_error "stormy"}
    end

  end
end
