require 'weather'

describe Weather do

  it "provides an answer to .stormy?" do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

  it "provides a random answer" do
    weather_array = []
    100.times {weather_array << subject.stormy?}
    expect(weather_array).to include(true, false)
  end
end
