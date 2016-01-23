require 'plane'

describe Plane do

  describe '#initialize' do

    it {is_expected.to respond_to(:airborne)}
    it 'should initialize as not airborne' do
      expect(subject.airborne).to be false
    end

  end

  describe '#takeoff' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) {double :airport}
    it 'should be able to be airborne' do
      expect(subject.takeoff(airport)).to be true
    end

  end

  describe '#land' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) {double :airport}
    it 'should be able to land' do
      expect(subject.land(airport)).to be false
    end

  end

end
