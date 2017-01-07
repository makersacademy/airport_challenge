require "airport"
describe Airport do
  let(:good_weather) {double :good_weather, stormy?: false}
  let(:bad_weather)  {double :bad_weather,  stormy?: true}
  let(:landed_plane) {double :landed_plane}
  let(:flying_plane) {double :landed_plane}

  describe "#stormy?" do
    it "should say false if the station says false" do
      subject.instance_variable_set(:@weather_station, good_weather)
      is_expected.not_to be_stormy
    end
    it "should say true if the station says true" do
      subject.instance_variable_set(:@weather_station, bad_weather)
      is_expected.to be_stormy
    end
  end

  describe "#plane_landed" do
    it{is_expected.to respond_to(:plane_landed).with(1).argument}
  end

  describe "#plane_taken_off" do
    it{is_expected.to respond_to(:plane_taken_off).with(1).argument}
  end

  describe "#take_off_request?" do
    context "weather is good" do
      before(:each) do
        subject.instance_variable_set(:@weather_station, good_weather)
      end
      it{expect(subject.take_off_request?).to eq true}
    end
    context "weather is good" do
      before(:each) do
        subject.instance_variable_set(:@weather_station, bad_weather)
      end
      it{expect(subject.take_off_request?).to eq false}
    end
  end

  describe "#full?" do
    it{is_expected.not_to be_full}
    it "should return true when full"
  end

  describe "landing_request?" do
    context "weather is good" do
      before(:each) do
        subject.instance_variable_set(:@weather_station, good_weather)
      end
      it{expect(subject.landing_request?).to eq true}
    end
    context "weather is good" do
      before(:each) do
        subject.instance_variable_set(:@weather_station, bad_weather)
      end
      it{expect(subject.landing_request?).to eq false}
    end
  end

  describe "#initialize" do
    it{expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY}
    it{expect(Airport.new(3).capacity).to eq 3}
    it "should create its own weather station if not given one" do
      expect(Airport.new.weather_station.class).to eq WeatherStation
    end
  end
end
