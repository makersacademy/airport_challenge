require 'plane'

describe Plane do

subject(:plane) {described_class.new}
let(:airport) {double(:airport)}
before do
  allow(airport).to receive(:clear_to_land?).and_return(true)
  allow(airport).to receive(:land)

end

  describe '#initialize' do
    it 'by default plane\'s are in the air' do
      expect(plane.flying?).to eq true
    end

    it 'by default plane\'s are not at an airport' do
      expect(plane.airport_at).to eq :not_in_airport
    end
  end

  describe '#land' do
    it 'won\'t land if it\'s not clear' do
      allow(airport).to receive(:clear_to_land?).and_return(false)
      message = 'Not clear to land'
      expect{plane.land(airport)}.to raise_error message
    end

    it 'allows confirmation that the plane has landed' do
      allow(airport).to receive(:land)
      plane.land(airport)
      expect(plane.flying?).to eq false
    end
  end

  describe '#take_off' do
    it 'allows confirmation that the plane has taken off' do
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.flying?).to eq true
    end
  end

  describe '#airport_at' do
    it 'knows which airport it has landed at' do
      plane.land(airport)
      expect(plane.airport_at).to eq airport
    end

    it 'knows it is not at an airport after take off' do
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.airport_at).to eq :not_in_airport
    end
  end

  context 'edge cases' do

    it 'can\'t take off if already flying' do
      plane.land(airport)
      plane.take_off(airport)
      message = "Can't take off, already in the air."
      expect{plane.take_off(airport)}.to raise_error message
    end

    it 'can\'t land if already on the ground' do
      allow(plane).to receive(:flying?).and_return(false)
      message = "Can't land, already on the ground."
      expect{plane.land(airport)}.to raise_error message
    end

  end
end
