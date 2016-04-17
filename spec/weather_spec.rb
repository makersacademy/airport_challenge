require 'weather'
describe Weather do

  it "can be checked" do
    is_expected.to respond_to :goodweather?
  end

  it "generates instances of good and bad weather" do
      weather_history = []
      1000.times do
        weather_history << subject.goodweather?
      end
      expect(weather_history).to include false
  end

end
