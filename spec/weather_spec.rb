require "weather"

describe Weather do
  it "responds to stormy?" do
    expect(subject).to respond_to :stormy?
  end

  it "responds with true when rand num is divisible by 3" do
    weather = Weather.new
    weather.stub(:rand_num).and_return(3)
    expect(weather.stormy?).to eq true
  end
end