require 'plane'
require 'airport'

describe Airport do
  test_airport = Airport.new
  test_plane = Plane.new("AB123", test_airport, test_airport)

  it "has a code and returns it" do
    expect(subject.code).to be_a(String)
  end

  it "should have a maximum capactity" do
    expect(Airport.new.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  context "when the airport is full" do
    it "planes must be prevented from landing" do
      subject.gates = Array.new(Airport::DEFAULT_CAPACITY, Plane.new)
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.safe_to_land?).to eq(false)
    end
  end
  
  describe 'safe_to_land?' do
    it "returns false when it is considered unsafe to land" do
      allow(subject).to receive(:local_weather) { :stormy }
      expect(subject.safe_to_land?).to eq(false)
    end  
  end

  describe 'safe_to_takeoff?' do
    it "returns false when it is considered unsafe to takeoff" do
      allow(subject).to receive(:local_weather) { :stormy }
      expect(subject.safe_to_takeoff?).to eq(false)
    end
  end

  describe 'local_weather' do
    it "returns :clear when rand throws 1..5" do
      allow(subject).to receive(:rand).and_return(1, 5)
      expect(subject.local_weather).to be(:clear)
    end
    it "returns :stormy when the rand throws a 6" do
      allow(subject).to receive(:rand).and_return(6)
      expect(subject.local_weather).to be(:stormy)
    end
    context "if the weather is stormy" do
      it "it updates the safety methods" do
        allow(subject).to receive(:local_weather) { :stormy }
        expect(subject.safe_to_land?).to eq(false)
        expect(subject.safe_to_takeoff?).to eq(false)
      end
    end
  end
end
