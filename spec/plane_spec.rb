require "plane"

describe Plane do

let(:airport) {double :airport, land: nil, take_off: nil }
subject(:plane) { described_class.new}

  context "When not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it "Is not flying when it lands" do
        airport.land(plane)
        expect(plane.flying?).to eq false
      end
      
      it "Is not flying when landed" do
        airport.land(plane)
        airport.take_off(plane)
        airport.land(plane)
        expect(plane.flying?).to eq false
      end


  end

  it "Is not flying by default" do
    expect(plane.flying?).to eq false
  end


end
