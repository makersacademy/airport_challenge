require "./lib/airport"
require "./lib/plane"
require "./lib/weather_station"
require "./lib/air_traffic_control"

describe "full feature test" do
  let(:good_weather) {double :good_weather, stormy?: false}
  let(:bad_weather)  {double :bad_weather,  stormy?: true}
  before :each do
    @plane = Plane.new
    @control = AirTrafficControl.new
    @capacity = 5
  end

  context "weather is good" do
    before(:each){@airport = Airport.new @capacity, good_weather}

    it "will accept planes landing" do
      expect(@control.land_plane @plane, @airport).to eq true
    end
    it "won't accept the same plane landing twice" do
      @control.land_plane @plane, @airport
      expect(@control.land_plane @plane, @airport).to eq false
    end
    it "won't land plane if airport is full" do
      @capacity.times{(@control.land_plane Plane.new, @airport)}
      expect(@control.land_plane @plane, @airport).to eq false
    end
  end

  context "weather is bad" do
    before(:each){@airport = Airport.new 5, bad_weather}

    it "will not accept planes landing" do
      expect(@control.land_plane @plane, @airport).to eq false
    end
    it "will not accept planes taking off" do
      subject.instance_variable_set(:@landed, true)
      subject.instance_variable_set(:@airport, @airport)
      expect(@control.take_off_plane @plane, @airport).to eq false
    end
  end
end
