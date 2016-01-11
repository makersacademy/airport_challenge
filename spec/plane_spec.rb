require 'plane'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {double(:airport,name: "JFK",planes: [],approve_landing?: true,approve_takeoff?: true)}

  describe '<><> Plane state <><>' do
    it 'is flying by default' do
      expect(plane.is_flying).to eq true
    end
    it 'returns false if plane is not flying' do
      plane.land(airport)
      expect(plane.is_flying).to eq false
    end

    it 'returns true if plane is flying' do
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.is_flying).to eq true
    end
  end

  describe '<><> Landing <><>' do
    it 'can land at an airport' do
      expect(plane.land(airport)).to eq "Landed at #{airport.name}!"
    end

    it 'prevents second landing' do
      plane.land(airport)
      expect{plane.land(airport)}.to raise_error "This plane is already landed"
    end
  end

  describe '<><> Take off <><>' do
    it 'can take off from an airport' do
      plane.land(airport)
      expect(plane.take_off(airport)).to eq "Taking off!"
    end

    it 'prevents second take off' do
      plane.land(airport)
      plane.take_off(airport)
      expect{plane.take_off(airport)}.to raise_error "This plane is already flying"
    end
  end
end
