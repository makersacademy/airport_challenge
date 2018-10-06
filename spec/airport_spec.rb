require 'airport'

describe Airport do

  describe '#random_generator' do

    it { expect(subject.random_generator).to be_between(1, 5) }

  end

  describe '#take_off' do

    it 'plane takes off from airport' do
      plane = double :plane, location: subject
      airport = Airport.new(5, [plane])
      allow(airport).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'raises error when trying to take off in stormy weather' do
      plane = double :plane
      airport = Airport.new(5, [plane])
      allow(airport).to receive(:check_storm?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error 'Cannot land or take off in storm'
    end

    it 'plane cannot take off from airport if not in airport' do
      plane = double :plane, location: :in_flight
      allow(subject).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=)
      expect { subject.take_off(plane) }.to raise_error 'Plane not in airport'
    end

  end

  describe '#land' do

    it 'lands plane at airport in good weather' do
      plane = double :plane, location: :in_flight
      allow(subject).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=).with(subject).and_return(subject)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'raises error when trying to land in stormy weather' do
      plane = double :plane, location: :in_flight
      allow(subject).to receive(:check_storm?).and_return(true)
      allow(plane).to receive(:location=)
      expect { subject.land(plane) }.to raise_error 'Cannot land or take off in storm'
    end

    it 'raises an error if airport already at capacity' do
      plane = double :plane, location: :in_flight
      allow(subject).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=)
      5.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport at capacity'
    end

    it 'allows for different airport capacities' do
      plane = double :plane, location: :in_flight
      bigger_airport = Airport.new(6)
      allow(bigger_airport).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=).with(bigger_airport).and_return(bigger_airport)
      6.times { bigger_airport.land(plane) }
      expect(bigger_airport.planes.length).to eq 6
    end

    it 'raises error if airport attempts to land plane which is not in flight' do
      plane = double :plane, location: subject
      allow(subject).to receive(:check_storm?).and_return(false)
      allow(plane).to receive(:location=)
      expect { subject.land(plane) }.to raise_error 'Plane not in flight'
    end

  end

end
