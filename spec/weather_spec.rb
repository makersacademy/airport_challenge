require 'weather'

describe Weather do
  it "should respond to condition" do
    expect(subject).to respond_to(:condition)
  end

  it "should be either Sunny or Stormy" do
    expect(["Sunny", "Stormy"]).to include subject.condition
  end

  it "should be either kinds of weather at random" do
    weathers = Array.new(100){Weather.new.condition}
    expect(weathers).to include "Stormy"
    expect(weathers).to include "Sunny"
  end
end
