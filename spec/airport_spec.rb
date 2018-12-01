require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:in_airport?).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not let the same plane land twice' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already landed'
    end
  end

  describe '#take_off' do
    it 'lets a plane take_off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it 'does not let the same plane take off twice' do
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error 'Plane already flying'
    end
  end

  describe '#in_airport' do
    it 'checks if a plane is not in an airport' do
      expect(subject.in_airport?(plane)).to eq false
    end

    it 'checks if a plane is in an airport' do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end
  end

end
