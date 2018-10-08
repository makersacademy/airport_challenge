require "./lib/weather.rb"

describe Weather do

  it "sends weather out when requested" do
    expect(subject).to respond_to(:set_weather)
  end

  it "sends weather out when requested" do
    expect(subject.set_weather).to eq(("sunny") || ("stormy"))
  end
end
