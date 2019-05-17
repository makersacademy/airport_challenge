require 'plane'

describe 'plane' do
  let(:plane) { Plane.new }
  let(:air_force_1) { Plane.new }
  let(:lsx_airport) { double(:airport, :name => 'Los Santos International', :code => 'LSX').as_null_object }
  let(:dhs_airport) { double(:airport, :name => 'Death Star Spaceport', :code => 'DHS').as_null_object }

  context 'when landing at an airport' do
    it 'returns a friendly string' do
      expect(plane.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
      expect(air_force_1.land(dhs_airport)).to eq("Plane landed at #{dhs_airport.name} (#{dhs_airport.code})")
    end
    it 'calls the airport to receive itself' do
      expect(lsx_airport).to receive(:receive).with(plane)
      plane.land(lsx_airport)
    end

  end

  context 'when asked to land if already at an airport' do
    it "doesn't land at second airport" do
      plane.land(lsx_airport)
      expect(dhs_airport).not_to receive(:receive)
      plane.land(dhs_airport)
    end
    it "returns a friendly message" do
      plane.land(lsx_airport)
      expect(plane.land(dhs_airport)).to eq("I'm already at an airport!")
    end
  end

  context "when taking off from an airport" do
    it "returns a friendly string" do
      plane.land(lsx_airport)
      expect(plane.take_off(lsx_airport)).to eq("Plane took off from #{lsx_airport.name} (#{lsx_airport.code})")
    end
    it "calls release on airport" do
      plane.land(lsx_airport)
      expect(lsx_airport).to receive(:release).with(plane)
      plane.take_off(lsx_airport)
    end
    it "calls cleared_for_takeoff? on airport with self" do
      expect(lsx_airport).to receive(:cleared_for_takeoff?).with(plane)
      plane.take_off(lsx_airport)
    end
  end

  context "when asked to take off from an airport where not located" do
    it "does not call release on airport" do
      allow(lsx_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(true)
      allow(dhs_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(false)

      plane.land(lsx_airport)
      expect(dhs_airport).not_to receive(:release)
      plane.take_off(dhs_airport)
    end

    it "returns a friendly string" do
      allow(lsx_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(true)
      allow(dhs_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(false)

      plane.take_off(lsx_airport)
      expect(plane.take_off(dhs_airport)).to eq("I'm not at that airport!")
    end

    it "can later be asked to take off from the correct airport" do
      allow(lsx_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(true)
      allow(dhs_airport).to receive(:cleared_for_takeoff?).with(plane).and_return(false)

      plane.land(lsx_airport)
      plane.take_off(dhs_airport)
      expect(lsx_airport).to receive(:release).with(plane)
      plane.take_off(lsx_airport)
    end
  end

  context "when asked to take off if already in the air" do
    it "won't take off again until landing" do
      plane.land(lsx_airport)
      plane.take_off(lsx_airport)
      expect(lsx_airport).not_to receive(:release)
      plane.take_off(lsx_airport)
    end

    it "returns a friendly string" do
      plane.land(lsx_airport)
      plane.take_off(lsx_airport)
      expect(lsx_airport).not_to receive(:release)
      expect(plane.take_off(lsx_airport)).to eq("I'm not at that airport!")
    end

  end
end