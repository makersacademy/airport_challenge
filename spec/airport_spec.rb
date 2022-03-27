require_relative '../lib/airport.rb'

describe Airport do
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }
  let(:airport) { Airport.new(5) }

  describe '#capacity' do
    it 'should confirm default capacity is set to 10.' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should allow user to set the docking station capacity' do
      allow(airport).to receive(:storm?).and_return false
      5.times { airport.land(be_an_instance_of plane) }
      expect{ airport.land(plane) }.to raise_error 'Hangar full.'
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should store a plane in hangar when landed' do
      allow(subject).to receive(:storm?).and_return false
      expect(subject.land(plane)).not_to be_empty
    end

    it 'raises an error when hangar is full.' do
      allow(subject).to receive(:storm?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(be_an_instance_of plane) }
      expect { subject.land(plane) }.to raise_error 'Hangar full.'
    end

    it 'should raise error if grounded plane tries landing again.' do
      allow(subject).to receive(:storm?).and_return false
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already grounded.'
    end

    it 'raises error when plane tries to land during storm' do
      allow(subject).to receive(:storm?).and_return true
      expect { subject.land(plane) }.to raise_error 'Weather stormy, landing not available.'
    end

    it 'should not raise an error for landing planes when weather clear' do
      allow(subject).to receive(:storm?).and_return false
      expect { subject.land(plane) }.to_not raise_error
    end

    # Didn't get around to looking futher into this edge case 
    # it 'should raise error if grounded plane tries to land in different airport.' do
    #   subject.land(plane)
    #   expect { airport.land(plane) }.to raise_error 'Plane in another airport.'
    # end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should remove plane from airport' do
      allow(subject).to receive(:storm?).and_return false
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'should remove the plane requested from airport' do
      allow(airport).to receive(:storm?).and_return false
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'raises an error when there are no planes in the hangar' do
      expect { subject.take_off(plane) }.to raise_error 'No planes in hangar.'
    end

    it 'should raise error if flying plane tries take_off again.' do
      allow(subject).to receive(:storm?).and_return false
      subject.land(plane)
      expect { subject.take_off(plane2) }.to raise_error 'Plane not in hangar.'
    end

    it 'raises error when plane tries to take off during storm' do
      allow(subject).to receive(:storm?).and_return false
      subject.land(plane)
      allow(subject).to receive(:storm?).and_return true
      expect { subject.take_off(plane) }.to raise_error 'Weather stormy, take off not available.'
    end

    it 'should not raise an error on plane take off when weather clear' do
      allow(subject).to receive(:storm?).and_return false
      subject.land(plane)
      expect { subject.take_off(plane) }.to_not raise_error
    end
  end
end