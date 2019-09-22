require 'airport'

describe Airport do

  describe '#let_land' do
    it { is_expected.to respond_to(:let_land).with(1).argument }

    it 'raise an error if airport is full' do
      airport = Airport.new(6)
      allow(airport).to receive(:stormy_weather?) { false }
      6.times { airport.let_land(Plane.new) }
      expect { airport.let_land(Plane.new) }.to raise_error 'Impossible, airport full'
    end

    let(:plane) { Plane.new }

    it 'raise error if plane already landed' do
      allow(subject).to receive(:stormy_weather?) { false }
      plane.landed = true
      expect { subject.let_land(plane) }.to raise_error 'Impossible, plane already landed'
    end

    it 'raise an error if weather is stormy' do
      allow(subject).to receive(:stormy_weather?) { true }
      expect { subject.let_land(plane) }.to raise_error 'Impossible, the weather is stormy'
    end

    it 'land a plane' do
      allow(subject).to receive(:stormy_weather?) { false }
      result = subject.let_land(plane)
      expect(result).to eq subject.planes
    end
  end

  describe '#let_take_off' do
    let(:plane) { Plane.new }
    it { is_expected.to respond_to(:let_take_off).with(1).argument }

    it 'raise an error if plane is already flying' do
      allow(subject).to receive(:stormy_weather?) { false }
      plane.flying = true
      expect { subject.let_take_off(plane) }.to raise_error 'Impossible, plane is already flying'
    end

    it 'raise an error if weather is stormy' do
      allow(subject).to receive(:stormy_weather?) { true }
      expect { subject.let_land(plane) }.to raise_error 'Impossible, the weather is stormy'
    end

    it 'take off a plane' do
      allow(subject).to receive(:stormy_weather?) { false }
      result = subject.let_take_off(plane)
      expect(result).to eq subject.planes
    end
  end
end
