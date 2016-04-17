require 'plane'

describe Plane do
  let(:airport) { double(:airport, weather: "sunny", full?: false) }
  let(:another_airport) { double(:another_airport, weather: "sunny", full?: false) }
  let(:plane) {Plane.new(airport)}

  describe '#initialize' do
    it 'plane is landed, not flying' do
      expect(plane.landed?).to eq true
    end
  end

  describe '#landed?' do
    context 'plane can confirm if it is landed' do
      it 'it confirms landed' do
        plane.landed_at(airport)
        expect(plane.landed?).to eq true
        expect(plane.flying?).to eq false
      end
    end
  end

  describe '#flying?' do
    context 'plane can confirm it is flying' do
      it 'it confirms flying' do
        plane.is_flying
        expect(plane.flying?).to eq true
        expect(plane.landed?).to eq false
      end
    end
  end

  describe '#current_airport' do
    it 'reports its current airport when landed' do
      plane.landed_at(airport)
      expect(plane.current_airport).to eq airport
    end
    it 'reports nil (no longer in an airport) if flying' do
      plane.is_flying
      expect(plane.current_airport).to eq nil
    end
  end

  describe '#landed_at(airport)' do
    it 'lands plane at airport' do
      expect(plane.landed_at(airport)).to eq true
    end
  end

  describe '#is_flying' do
    it 'returns true' do
      expect(plane.is_flying).to eq true
    end
  end

end
