require 'Airport'

describe Airport do
  let(:plane) { double :plane }
  let(:alt_plane) { double :plane }

  describe '#add_plane' do
    it 'can add a plane to the airport' do
      subject.add_plane(plane)
      expect(subject.planes.last).to eq plane
      expect(subject.planes.length).to eq 1
    end
    it 'can add 20 planes to the airport' do
      20.times { subject.add_plane(plane) }
      expect(subject.planes.length).to eq 20
    end
  end

  describe '#remove_plane' do
    it 'can remove a plane from the airport' do
      subject.add_plane(plane)
      subject.remove_plane(plane)
      expect(subject.planes.length).to eq 0
      subject.add_plane(plane)
      subject.add_plane(alt_plane)
      subject.remove_plane(plane)
      expect(subject.planes.length).to eq 1
    end
  end

  describe '#clear_weather?' do
    it 'returns false if weather is cloudy' do
      subject.weather = 'Cloudy'
      expect(subject.clear_weather?).to eq false
    end
    it 'returns true if the weatehr is sunny' do
      subject.weather = 'Sunny'
      expect(subject.clear_weather?).to eq true
    end
  end

  describe '#initialize' do
    it 'sets capacity to the default if no argument given' do
      expect(subject.capacity).to eq Airport::DEFAULTCAPACITY
    end
    it 'sets capacity to 30 if passed 30 as an argument' do
      tester = Airport.new(30)
      expect(tester.capacity).to eq 30
    end
  end
end
