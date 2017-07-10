require "weather"

describe Weather do

  it "is stormy" do
    expect(subject.weather_pattern).to eq :stormy or :sunny
  end
=begin
  it "is sunny" do
    expect(subject.weather_pattern).to eq :sunny
  end
=end
end
