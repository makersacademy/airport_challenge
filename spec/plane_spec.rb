require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double("airport")}

  describe '#status' do
    it {is_expected.to respond_to(:airborne?)}

    it 'should tell you if a plane is in the air' do
      plane.flying
      expect(plane.airborne?).to eq true
    end

    it 'should tell you is a plan is on the ground' do
      plane.landed
      expect(plane.airborne?).to eq false
    end
  end

  describe '#flying' do
    it {is_expected.to respond_to(:flying)}
  end

  describe '#landed' do
    it {is_expected.to respond_to(:landed)}
  end




end
