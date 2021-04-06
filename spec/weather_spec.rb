require "weather.rb"
describe Weather do
  # responds to stormy?
  it { is_expected.to respond_to(:stormy?) }
  # if yes, prevent take_off. i.e. take_off raises an exception
  it "raises an exception when weather is stormy" do
    if Weather.new.stormy? == "yes"
      airport = Airport.new
      expect { airport.take_off }.to raise_error(StormyWeather, "Stormy weather, can't take off")
    end
  end

  # create a hash that is used to randomly decide weather status.

  it "randomly assigns weather status" do
    expect(subject.stormy?).to eq("yes").or(eq("no"))
  end

  it "refuses to land when weather is stormy" do
    if Weather.new.stormy? == "yes"
      airport = Airport.new
      expect { airport.land }.to raise_error(StormyWeather, "Stormy weather")
    end
  end
end
