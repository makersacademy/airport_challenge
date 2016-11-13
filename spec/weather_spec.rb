require "weather"

describe Weather do

  it "should instantiate with a random weather effect" do
    expect(subject.instance_variable_get(:@weather_effect)).to eql("stormy") | eql("not stormy")
  end

end
