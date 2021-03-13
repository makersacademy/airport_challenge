require 'plane'
require 'airport'

describe Airport do
  test_airport = Airport.new("ABC")

  describe "airport code" do
    it "must be a string" do
      expect(test_airport.code).to be_a(String)
    end
  end

  it "must have a default maximum capactity" do
    expect(Airport.new.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  context "when the airport is full" do
    it "planes must be prevented from landing" do
      subject.gates = Array.new(Airport::DEFAULT_CAPACITY, Plane.new)
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.at_capacity?).to eq(true)
    end
  end
  
  describe 'safe_to_manoeuvre?' do
    it "must return false when it is considered unsafe to land or takeoff" do
      allow(subject).to receive(:local_weather) { :stormy }
      expect(subject.safe_to_manoeuvre?).to eq(false)
    end
  end

  describe 'local_weather' do
    it "must return :clear when rand throws 1..5" do
      allow(subject).to receive(:rand).and_return(1, 5)
      expect(subject.local_weather).to be(:clear)
    end
    it "must return :stormy when rand throws a 6" do
      allow(subject).to receive(:rand).and_return(6)
      expect(subject.local_weather).to be(:stormy)
    end
    context "if the weather is stormy" do
      it "the outcomes of safe_to_land and safe_to_Takeoff? must be false" do
        allow(subject).to receive(:local_weather) { :stormy }
        expect(subject.safe_to_manoeuvre?).to eq(false)
      end
    end
  end
end
