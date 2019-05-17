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
end