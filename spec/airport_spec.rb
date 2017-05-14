require 'airport.rb'

describe Airport do
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    describe '#land_plane' do

    it { is_expected.to respond_to(:plane)}
    it { is_expected.to respond_to(:full?)}

    it 'returns the landed planes' do
        planes = []
        plane = double(:plane)
        allow(subject).to receive (:stormy?) {false}
        subject.land_plane(plane)
        planes << plane
        expect(subject.plane).to eq planes
    end
    it 'raises an error when you try and land the same plane multiple times at the same airport' do
         plane = double(:plane)
         allow(subject).to receive (:stormy?) {false}
         subject.land_plane(plane)
         expect { subject.land_plane(plane) }.to raise_error "This plane has already landed!"
    end
    it 'stops the plane from landing when it is stormy' do
      plane = double(:plane)
      allow(subject).to receive (:stormy?) {false}
      subject.land_plane(plane)
      subject.take_off(plane)
      allow(subject).to receive (:stormy?) {true}
      expect { subject.land_plane(plane)}.to raise_error "Too stormy!"
    end
    it 'raises an error when attempting to land at a full station' do
      allow(subject).to receive (:stormy?) {false}
      subject.capacity.times {subject.land_plane(double(:plane))}
      expect { subject.land_plane(double(:plane)) }.to raise_error 'Airport full!'
    end
  end

    it { is_expected.to respond_to(:take_off).with(1).argument}

    describe '#take_off' do
      it 'stops the plane from taking off when it is stormy' do
        plane = double(:plane)
        allow(subject).to receive (:stormy?) {false}
        subject.land_plane(plane)
        allow(subject).to receive (:stormy?) {true}
        expect { subject.take_off(plane)}.to raise_error "Too stormy!"
      end
      it 'raises an error when attempting to take off a plane which is not at the airport' do
        plane = double(:plane)
        plane2 = double(:plane)
        allow(subject).to receive (:stormy?) {false}
        subject.land_plane(plane)
        expect { subject.take_off(plane2) }.to raise_error "This plane is not at the airport!"
      end
    end

    describe 'Capacity' do
      it 'lets the user set capacity' do
        airport = Airport.new(20)
        20.times do
          allow(airport).to receive (:stormy?) {false}
          airport.land_plane(double(:plane))
        end
        allow(airport).to receive (:stormy?) {false}
        expect {airport.land_plane(double(:plane))}.to raise_error "Airport full!"
      end
    end
end
