require "weather"

describe Weather do

  it "should have a random weather effect" do
    expect(subject.weather_effect).to eql("stormy") | eql("not stormy")
  end

end
