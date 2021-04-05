require "weather.rb"
# create a new class weather that tells you when the weather is stormy
describe Weather do
  # responds to stormy?
  it { is_expected.to respond_to(:stormy?) }
  # if yes, prevent take_off. i.e. take_off raises an exception
  it "raises an exception when weather is stormy" do
    if subject.stormy? == "yes"
      airport = Airport.new
      expect { airport.take_off }.to raise_error(StormyWeather, "Stormy weather, can't take off")
    end
  end
end