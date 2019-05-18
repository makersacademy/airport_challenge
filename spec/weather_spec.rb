require "weather"
describe Weather do
  let(:weather) {
    Weather.new
  }

  it "will be stormy" do
    srand(5) # chosen_state is 4 so we have stormy weather
    expect(weather.stormy).to be true
  end

  it "will be sunny" do
    srand(3) # chosen_state is 9 so we have sunny weather
    expect(weather.stormy).to be false
  end
end
