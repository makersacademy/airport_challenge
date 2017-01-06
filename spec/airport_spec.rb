require "airport"
describe Airport do
  let(:good_weather) {double :good_weather, stormy?: false}
  let(:bad_weather)  {double :bad_weather , stormy?: true}
  describe "#stormy?" do
    it{is_expected.to respond_to :stormy?}
  end
  describe "#initialize" do
    it "it will create its own weather station if not given one" do
      expect{Airport.new;subject}.not_to raise_error
    end
    it "it will say false if the station says false" do
      Airport.new good_weather
      is_expected.not_to be_stormy
    end
    it "it will say true if the station says true" do
      Airport.new bad_weather
      is_expected.to be_stormy
    end
  end
end
