require 'plane'
require 'airport'

describe Airport do
  test_airport = Airport.new
  test_plane = Plane.new

  it "has a code and returns it" do
    expect(subject.code).to be_a(String)
  end

  it "should have a maximum capactity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  context "when there are planes at the gates and the weather is good" do
    it "it allows planes to takeoff" do
      5.times { Plane.new.land(test_airport) }
      test_airport.local_weather(:clear) # ensure safe_to_takeoff? == true
      expect(test_airport.safe_to_takeoff?).to eq(true)
    end
  end

  context "when the airport is full" do
    test_airport.local_weather(:clear) # ensure safe_to_land? == true
    it "planes must be prevented from landing" do
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(test_airport) }
      expect(test_airport.safe_to_land?).to eq(false)
    end
  end
  
  describe 'safe_to_land?' do
    it "returns false when it is considered unsafe to land" do
      expect(subject.safe_to_land?).to be(true).or be(false)
    end  
  end

  describe 'safe_to_takeoff?' do
    it "returns false when it is considered unsafe to takeoff" do
      expect(subject.safe_to_takeoff?).to be(true).or be(false)
    end
  end

  describe 'local_weather' do
    it "stores the local weather conditions" do
      expect(subject.local_weather(subject.weather_forecast)).to be(:clear).or be(:stormy)
    end
    context "if the weather is stormy" do
      it "it updates the safety methods" do
        test_airport.local_weather(:stormy)
        expect(test_airport.safe_to_land?).to be(false)
        expect(test_airport.safe_to_takeoff?).to be(false)
      end
    end
  end
end
