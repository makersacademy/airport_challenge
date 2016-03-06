require 'plane'

describe Plane do
let(:airport) { double :airport, :planes => [] }

  describe '#flying' do
    it { is_expected.to respond_to :flying }
  end

  describe '#land' do
    it '1.0 plane is no longer flying' do
      allow(airport).to receive(:allow_landing).and_return(:plane)
      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)
      expect(subject.flying).to be(false)
    end

    it '1.1 lands the plane in a specific airport' do
      allow(airport).to receive(:allow_landing).and_return(:plane)
      allow(airport).to receive(:planes).and_return(:planes)

      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)

      expect(airport.planes.empty?).to be(false)
    end


    it '1.2 raises an error - CANNOT LAND A LANDED PLANE' do
      allow(airport).to receive(:allow_landing).and_return(:plane)
      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}

      subject.land(airport)
      expect {subject.land(airport)}.to raise_error "CANNOT LAND A LANDED PLANE"
    end

  end

  describe '#take_off' do
    #let(:airport) { double :airport, :planes => [] }

    it '2.0 plane is flying' do
      allow(airport).to receive(:allow_landing).and_return(:plane)
      allow(airport).to receive(:allow_take_off).and_return(:plane)

      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)

      subject.take_off(airport)
      expect(subject.flying).to be(true)
    end

    it '2.1 take_off calls the allow_take_off method' do
      allow(airport).to receive(:allow_landing).and_return(:plane)
      allow(airport).to receive(:allow_take_off).and_return(:plane)
      #allow(airport).to receive(:planes).and_return(:planes)

      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      subject.land(airport)
      expect(airport).to receive(:allow_take_off)
      subject.take_off(airport)
    end

    it '2.2 raises an error - A FLYING PLANE CANNOT TAKE-OFF' do


      #airport = Airport.new
      allow(airport).to receive(:stormy?) {false}

      expect {subject.take_off(airport)}.to raise_error "A FLYING PLANE CANNOT TAKE-OFF"
    end

  end

end
