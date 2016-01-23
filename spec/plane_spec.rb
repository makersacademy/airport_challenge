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

    it 'should be able to be airborne' do
      expect(subject.takeoff).to be true
    end

  end

end
