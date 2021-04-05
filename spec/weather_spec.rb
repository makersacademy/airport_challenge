require "weather.rb"
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
  # create a hash that is used to randomly decide weather status.
  let(:expected_hash) do {1 => "no", 
    2 => "no", 
    3 => "no", 
    4 => "no",
    5 => "yes", 
    6 => "no", 
    7 => "no", 
    8 => "no", 
    9 => "no", 
    10 => "yes"}
  end

  it "randomly assigns weather status" do
    expect(subject.stormy?).to eq("yes" || "no")
  end
end