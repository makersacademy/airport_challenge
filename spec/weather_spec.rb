require "weather"

describe Weather do
  it "determines if the weather is stormy" do
    expect(subject.stormy?).to be true
  end
end
