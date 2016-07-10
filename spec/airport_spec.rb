require 'airport'
require 'weather'

describe Airport do

  describe '#land_plane' do
    subject(:plane) { described_class.new }

    it 'lands a plane' do
      allow(Weather).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end
      it 'has docked the plane' do
        allow(Weather).to receive(:stormy?).and_return(false)
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
      it 'creates error when weather stormy' do
        message = 'Weather too stormy right now'
        allow(plane).to receive(:landed).and_return(false)
        allow(Weather).to receive(:stormy?).and_return(true)
        expect {subject.land(plane)}.to raise_error message
      end
  end

    describe '#take_off' do
      subject(:plane) { described_class.new }

      it 'instructs the plane to take off from the Airport' do
        allow(Weather).to receive(:stormy?).and_return(false)
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
      end
      it 'confirms the plane has left the airport' do
        allow(Weather).to receive(:stormy?).and_return(false)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
    end
      it 'creates error when weather stormy' do
        message = 'Weather too stormy right now'
        allow(plane).to receive(:landed).and_return(true)
        allow(Weather).to receive(:stormy?).and_return(true)
        expect {subject.take_off(plane)}.to raise_error message
      end

  end

    describe '#capacity' do
       it 'prevents planes landing if there is no room' do
       allow(Weather).to receive(:stormy?).and_return(false)
       described_class::DEFAULT_CAPACITY.times{subject.land(Airplane.new)}
       expect {subject.land(Airplane.new)}.to raise_error "Airport full"
     end
   end
   it 'has a default capacity' do
     expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end
    it 'can change its capacity depending on the user' do
      allow(Weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(50)
      50.times { airport.land Airplane.new }
      expect{ airport.land Airplane.new }.to raise_error 'Airport full'
    end
end
