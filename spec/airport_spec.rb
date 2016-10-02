require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

let(:plane) { Plane.new(subject) }

  describe 'in good weather' do
    before do
      allow(Weather).to receive(:sunny?) {true}
    end

    it 'receives a plane' do
        expect(subject).to respond_to(:receive_plane).with(1).argument
    end

    it 'stores received planes' do
      subject.receive_plane(plane)
      subject.receive_plane(plane)
      expect(subject.planes).to eq([plane,plane])
    end

    it 'records that a plane is no longer at the airport once it takes off' do
      subject.receive_plane(plane)
      subject.release_plane(plane)
      expect(subject.planes).to eq([])
    end

    it 'allows you to check whether a specific plane is at an airport' do
      subject.receive_plane(plane)
      subject.release_plane(plane)
      expect(subject.plane_at_airport(plane)).to eq false
    end

    it 'should have a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should have a variable capacity' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end

    it 'should raise an error if a plane tries to land at a full airport' do
      airport = Airport.new(1)
      airport.receive_plane(plane)
      expect{airport.receive_plane(plane)}.to raise_error 'Airport full'
    end
  end

  describe 'in bad weather' do

    before do
      allow(Weather).to receive(:sunny?) {false}
    end

    it 'will not release planes' do
      airport = Airport.new
      plane = Plane.new(airport)
      airport.planes << plane
      expect{airport.release_plane(plane)}.to raise_error "It's too dangerous for planes to take off in the storm"
    end
  end
end
