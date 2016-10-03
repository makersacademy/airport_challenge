require './lib/plane'
require './lib/airport'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double("airport", :adverse_weather? => false, :add => true, :remove => true, :planes => [plane], :full? => false)}

  context "When everything is fine, basic functionality" do
    it 'can take off from an airport' do
      expect(plane).to respond_to(:take_off).with(1).argument
    end

    it 'can land at an airport' do
      expect(plane).to respond_to(:land).with(1).argument
    end

    it 'tells the controller it has landed' do
      plane.land(airport)
      expect(plane.status).to eq("Landed at airport " + airport.to_s)
    end

    it "makes airport add it to its planes when it lands" do
      expect(airport).to receive(:add).with(plane)
      plane.land(airport)
    end

    it 'tells the controller it has taken off' do
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.status).to eq("Has taken off from airport " + airport.to_s)
    end

    it "makes airport remove it from its planes when it takes off" do
      plane.land(airport)
      expect(airport).to receive(:remove).with(plane)
      plane.take_off(airport)
    end
  end

  context "When things go wrong" do
    let(:airport2) {double("airport", :adverse_weather? => false, :add => true, :remove => true, :planes => [], :full? => false)}
    let(:stormy_airport) {double("airport", :adverse_weather? => true, :add => true, :remove => true, :planes => [plane], :full? => false)}
    let(:full_airport) {double("airport", :planes => [plane], :adverse_weather? => false, :add => true, :remove => true, :full? => true)}

    it "doesn't take off when the weather is stormy" do
      expect{plane.take_off(stormy_airport)}.to raise_error("Cannot complete: adverse weather")
    end

    it "doesn't land when the weather is stormy" do
      expect{plane.land(stormy_airport)}.to raise_error("Cannot complete: adverse weather")
    end

    it "doesn't land when the airport has reached capacity" do
      expect{plane.land(full_airport)}.to raise_error("Cannot land at a full airport")
    end

    it "doesn't take off from an airport it's not in" do
      expect{plane.take_off(airport2)}.to raise_error("Cannot take off from an airport I'm not in")
    end

    it "cannot take off if it is flying" do
      plane.take_off(airport)
      expect{plane.take_off(airport)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
      expect{plane.take_off(full_airport)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
    end

    it "cannot land again if it has already landed" do
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error("Already landed... Landed at airport " + airport.to_s)
      expect{plane.land(airport2)}.to raise_error("Already landed... Landed at airport " + airport.to_s)
    end

    it "has a not in operation status if we have not told it to land or take off yet" do
      expect(plane.status).to eq("Not in operation")
    end
  end
end
