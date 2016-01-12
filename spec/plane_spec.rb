require 'plane'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {double(:airport,name: "JFK",planes: [],approve_landing?: true,approve_takeoff?: true)}

  describe '#is_flying' do
    it 'is flying when instantiated' do
      expect(plane.is_flying).to eq true
    end
    it 'returns false when plane has landed' do
      plane.land(airport)
      expect(plane.is_flying).to eq false
    end

    it 'returns true if plane has taken off' do
      plane.land(airport)
      plane.takeoff(airport)
      expect(plane.is_flying).to eq true
    end
  end

  describe '#land' do
    it 'can land at an airport' do
      expect(plane.land(airport)).to eq "Landed at #{airport.name}!"
    end

    it 'prevents second landing' do
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error "This plane is already landed"
    end
  end

  describe '#takeoff' do
    it 'can take off from an airport' do
      plane.land(airport)
      expect(plane.takeoff(airport)).to eq "Taking off!"
    end

    it 'prevents second take off' do
      plane.land(airport)
      plane.takeoff(airport)
      expect{plane.takeoff(airport)}.to raise_error "This plane is already flying"
    end
  end
end
