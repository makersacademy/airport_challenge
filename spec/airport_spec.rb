require 'airport'

describe Airport do
  let(:plane) { double :plane }
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'raises an error if the plane is already landed in the airport' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error('Plane is already landed in airport')
    end
    it 'raises an error if the airport is full' do
      subject.capacity.times do
        new_plane = double(:plane)
        subject.land(new_plane)
      end

      expect { subject.land(plane) }.to raise_error('Airport full')
    end
  end
  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    it 'raises an error if the plane has never landed at the airport' do
      expect { subject.takeoff(plane) }.to raise_error('Plane not in airport')
    end
    it 'raises an error if the plane has already taken off' do
      subject.land(plane)
      subject.takeoff(plane)
      expect { subject.takeoff(plane) }.to raise_error('Plane not in airport')
    end
  end
  describe '#landed?' do
    it { is_expected.to respond_to(:landed?).with(1).argument }
    it 'returns true if a plane has landed in the airport' do
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end
    it 'returns false if a plane has never landed at the airport' do
      expect(subject.landed?(plane)).to eq false
    end
    it 'returns false if a plane has taken off from the airport' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.landed?(plane)).to eq false
    end
  end
end
