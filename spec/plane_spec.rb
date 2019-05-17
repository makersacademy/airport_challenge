require 'plane'

describe 'plane' do
  let(:plane) { Plane.new }
  let(:lsx_airport) { double(:airport, :name => 'Los Santos International', :code => 'LSX').as_null_object }
  let(:dhs_airport) { double(:airport, :name => 'Death Star Spaceport', :code => 'DHS').as_null_object }

  context 'when landing at an airport' do
    it 'returns a friendly string' do
      expect(plane.land(lsx_airport)).to eq("Plane landed at #{lsx_airport.name} (#{lsx_airport.code})")
      expect(plane.land(dhs_airport)).to eq("Plane landed at #{dhs_airport.name} (#{dhs_airport.code})")
    end
    it 'calls the airport to receive itself' do
      expect(lsx_airport).to receive(:receive).with(plane)
      plane.land(lsx_airport)
    end
  end
end