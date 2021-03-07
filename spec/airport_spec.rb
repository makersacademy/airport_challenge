require 'plane'
require 'airport'

describe Airport do
  test_airport = Airport.new

  it "has a code and returns it" do
    expect(subject.code).to be_a(String)
  end

  it "should have a maximum capactity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  context "when there are planes at the gates and the weather is good" do
    it "it allows planes to takeoff" do
      5.times { Plane.new.land(test_airport) }
      allow(test_airport).to receive(:rand).and_return(1)
      expect(test_airport.safe_to_takeoff?).to eq(true)
    end
  end

  context "when the airport is full" do
    it "planes must be prevented from landing" do
      allow(test_airport).to receive(:rand).and_return(1)
      test_airport.local_weather
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(test_airport) }
      expect(test_airport.safe_to_land?).to eq(false)
    end
  end
  
  describe 'safe_to_land?' do
    it "should raise an error if it is unsafe to land" do
      allow(subject).to receive(:local_weather) { :stormy }
      expect(subject.safe_to_land?).to eq(false)
      # expect { subject.safe_to_land? }.to raise_error("The conditions do not allow landing at this time")
    end  
  end

  describe 'safe_to_takeoff?' do
    it "returns false when it is considered unsafe to takeoff" do
      allow(subject).to receive(:local_weather) { :stormy }
      expect(subject.safe_to_takeoff?).to eq(false)
      # expect { subject.safe_to_land? }.to raise_error("The conditions do not allow departure at this time")
    end
  end

  describe 'local_weather' do
    it "returns :clear when rand throws 1..5" do
      allow(subject).to receive(:rand).and_return(1,5)
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
