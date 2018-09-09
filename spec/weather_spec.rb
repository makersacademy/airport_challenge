require 'weather'

RSpec.describe Weather do

  it "can be initialized with the probability of stormy weather" do
    expect(Weather).to respond_to(:new).with(1).argument
  end

  it "has a method for checking if the weather is stormy" do
    expect(subject).to respond_to(:stormy?).with(0).argument
  end

  it "always returns weather which is either stormy or clear" do
    expect([true, false].include?(subject.stormy?)).to eq true
  end

end
