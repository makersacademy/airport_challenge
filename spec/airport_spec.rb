require 'airport'
describe Airport do
  let(:plane)  { double(:plane)}
  let(:flying_plane) {double(:plane, landed?: false)}
  let(:grounded_plane) {double(:plane, landed?: true)}

  describe '#land' do
    it "airport contains airplane that just landed" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(flying_plane).to receive(:land)
      subject.land(flying_plane)
      expect(subject.planes).to include flying_plane
    end
    it "plane wont land at airport if weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      allow(flying_plane).to receive(:land)
      expect{subject.land(flying_plane)}.to raise_error "It is stormy, plane cant land"
    end
    it "plane wont land if airport is full" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(flying_plane).to receive(:land)
      subject.capacity.times {subject.land(flying_plane)}
      expect {subject.land(flying_plane)}.to raise_error "Airport full, plane cant land"
    end

    it "plane cant be told to land if already on the ground" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(grounded_plane).to receive(:land)
      expect{subject.land(grounded_plane)}.to raise_error "Plane already on ground"
    end

  end
  describe '#take_off' do
    it "airport does not contain a plane that just took off" do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(grounded_plane).to receive(:take_off)
      subject.planes << grounded_plane
      subject.take_off(grounded_plane)
      expect(subject.planes).to be_empty
    end
    it "plane cant take off when weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      allow(grounded_plane).to receive(:take_off)
      subject.planes << grounded_plane
      expect{subject.take_off(grounded_plane)}.to raise_error "Weather is stormy, plane cant take off"
    end
    it "expects an error when plane that airport does not contain is asked to take off" do
      allow(subject.weather).to receive(:stormy?) { false }
      allow(grounded_plane).to receive(:take_off)
      expect{subject.take_off(grounded_plane)}.to raise_error "Airport does not contain this plane"
    end
  end

  describe '#full?' do
    it "takes custom capacity and checks if airport is" do
      airport = Airport.new(30)
      allow(airport.weather).to receive(:stormy?) { false }
      allow(flying_plane).to receive(:land)
      30.times {airport.land(flying_plane)}
      expect(airport.full?).to eq true
    end
    it "checks to see if there full returns false when there is space in the airport" do
      airport = Airport.new(40)
      allow(airport.weather).to receive(:stormy?) { false }
      allow(flying_plane).to receive(:land) {}
      39.times {airport.land(flying_plane)}
      expect(airport.full?).to eq false
    end
  end
end
