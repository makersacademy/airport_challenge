require 'plane'

describe Plane do

  describe '#flying' do
    it { is_expected.to respond_to :flying }
  end

  describe '#land' do
    it '1.0 plane is no longer flying' do
      allow(subject).to receive(:stormy?) {false}
      airport = Airport.new
      subject.land(airport)
      expect(subject.flying).to be(false)
    end

    it '1.1 lands the plane in a specific airport' do

      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)

      expect(airport.planes.empty?).to be(false)
    end

    it '1.2 raises an error - CANNOT LAND A LANDED PLANE' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}

      subject.land(airport)
      expect {subject.land(airport)}.to raise_error "CANNOT LAND A LANDED PLANE"
    end

  end
  describe '#take_off' do
    it '2.1 plane is flying' do

      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.flying).to be(true)
    end

    it '2.2 plane is not in the airport' do

      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes.empty?).to be(true)
    end

    it '1.2 raises an error - A FLYING PLANE CANNOT TAKE-OFF' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}

      expect {subject.take_off(airport)}.to raise_error "A FLYING PLANE CANNOT TAKE-OFF"
    end
  end

end
