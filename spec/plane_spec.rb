require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it {is_expected.to respond_to(:flying)}
  describe '#flying' do
    it 'should say the plane is flying' do
      expect(plane.flying).to be(true)
    end
  end

  it {is_expected.to respond_to(:landed)}
  describe '#landed' do
    it 'should say the plane has landed' do
      plane.landed
      expect(plane.flying).to be(false)
    end
  end

  it {is_expected.to respond_to(:cleared)}
  describe '#cleared' do
     it 'makes the plane take off' do
       plane.cleared
       expect(plane.flying).to be(true)
     end
  end

  it {is_expected.to respond_to(:takeoff)}
  describe '#takeoff' do
    it 'makes the plane fly' do
      plane.takeoff
      expect(plane.flying).to be(true)
    end
  end

  it {is_expected.to respond_to(:touch_down)}
  describe '#touch_down' do
    it 'makes the plane land' do
      plane.touch_down
      expect(plane.flying).to be(false)
    end
  end

  it {is_expected.to respond_to(:on_runway)}
  describe '#on_runway' do
    it 'puts the plane in the airport' do
      plane.on_runway
      expect(plane.in_airport).to be(true)
    end
  end

  it {is_expected.to respond_to(:in_airport)}
  describe '#in_airport' do
    it 'should say the plane is in the airport' do
      plane.on_runway
      expect(plane.in_airport).to be(true)
    end
  end

  it {is_expected.to respond_to(:fly_away)}
    describe '#fly_away' do
    it 'makes the plane leave the airport' do
      plane.on_runway
      plane.fly_away
      expect(plane.in_airport).to be(false)
    end
  end
end
