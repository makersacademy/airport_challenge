require 'weather'

RSpec.describe Weather do

  it "can be initialized with the probability of stormy weather" do
    expect(Weather).to respond_to(:new).with(1).argument
  end

  it "has a method for generating the weather" do
    expect(subject).to respond_to(:check_weather).with(0).argument
  end

  it "always returns weather which is either stormy or clear" do
    expect([:stormy, :clear].include?(subject.check_weather)).to eq true
  end

end
