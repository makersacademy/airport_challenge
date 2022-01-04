require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before :each do
    allow(plane).to receive(:airborne).and_return(true)
    allow(plane).to receive(:airborne=)
  end

  describe '#initialize' do
    it 'allows default capacity to be overriden' do
      airport_override = Airport.new(subject.capacity + 10)
      expect(airport_override.capacity).not_to eq subject.capacity
    end
    it 'does not accept a negative capacity' do
      expect { Airport.new(-1) }.to raise_error('Capacity must be positive')
    end
  end

  context 'when weather is clear' do
    before :each do
      set_stormy(subject, false)
    end

    describe '#land' do
      it { is_expected.to respond_to(:land).with(1).argument }

      it 'raises an error if the plane is already landed in the airport' do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error('Plane is already landed in airport')
      end

      it 'raises an error if the airport is full' do
        subject.capacity.times do
          new_plane = double(:plane)
          allow(new_plane).to receive(:airborne).and_return(true)
          allow(new_plane).to receive(:airborne=)
          subject.land(new_plane)
        end

        expect { subject.land(plane) }.to raise_error('Airport full')
      end

      it 'raises an error if the plane is not airborne' do
        allow(plane).to receive(:airborne).and_return(false)
        expect { subject.land(plane) }.to raise_error('Plane is not airborne')
      end
    end

    describe '#takeoff' do
      it { is_expected.to respond_to(:takeoff).with(1).argument }

      it 'raises an error if the plane has never landed at the airport' do
        expect { subject.takeoff(plane) }.to raise_error('Plane is not in airport')
      end

      it 'raises an error if the plane has already taken off' do
        subject.land(plane)
        allow(plane).to receive(:airborne).and_return(false)
        subject.takeoff(plane)
        allow(plane).to receive(:airborne).and_return(false)
        expect { subject.takeoff(plane) }.to raise_error('Plane is not in airport')
      end

      it 'raises an error if the plane is already airborne' do
        subject.land(plane)
        allow(plane).to receive(:airborne).and_return(true)
        expect { subject.takeoff(plane) }.to raise_error('Plane is already airborne')
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
        allow(plane).to receive(:airborne).and_return(false)
        subject.takeoff(plane)
        expect(subject.landed?(plane)).to eq false
      end
    end
  end

  context 'when weather is stormy' do
    it 'raises an error when landing a plane' do
      set_stormy(subject, true)
      expect { subject.land(plane) }.to raise_error('Weather is stormy')
    end

    it 'raises an error when taking off a plane' do
      set_stormy(subject, false)
      subject.land(plane)
      set_stormy(subject, true)
      allow(plane).to receive(:airborne).and_return(false)
      expect { subject.takeoff(plane) }.to raise_error('Weather is stormy')
    end
  end

  def set_stormy(airport, stormy)
    allow(airport.weather).to receive(:stormy?).and_return(stormy)
  end
end
