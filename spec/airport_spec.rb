require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:in_airport?).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not let the same plane land twice' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already landed'
    end

    it 'does not land a plane if airport is at capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error 'Airport at capacity'
    end
  end

  describe '#take_off' do
    it 'lets a plane take_off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it 'does not let the same plane take_off twice' do
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error 'Plane already flying'
    end

    it 'does not take_off if the plane is not in current airport' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(plane)

      expect { airport2.take_off(plane) }.to raise_error 'Plane not in current airport'
    end
  end

  describe '#in_airport?' do
    it 'checks if a plane is not in an airport' do
      expect(subject.in_airport?(plane)).to eq false
    end

    it 'checks if a plane is in an airport' do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end
  end

  # describe '#stormy' do
  #   it 'does not let planes land if the weather is stormy' do
  #     expect { subject.land(plane) }.to raise_error 'Plane cannot land due to stormy weather'
  #   end
  # end

end
