require "./lib/weather"

describe Weather do
  it "returns true or false when asked if it's stormy" do
    expect([true, false]).to include subject.stormy?
  end
end
