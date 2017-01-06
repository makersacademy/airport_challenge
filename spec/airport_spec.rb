require "airport"
describe Airport do
  let(:good_weather) {double :good_weather, stormy?: false}
  let(:bad_weather)  {double :bad_weather,  stormy?: true}
  describe "#stormy?" do
    it{is_expected.to respond_to :stormy?}
  end
  describe "#initialize" do
    it "should create its own weather station if not given one" do
      expect{Airport.new;subject}.not_to raise_error
    end
    it "should say false if the station says false" do
      expect((Airport.new good_weather).stormy?).to eq false
    end
    it "should say true if the station says true" do
      expect((Airport.new bad_weather).stormy?).to eq true
    end
  end
end
