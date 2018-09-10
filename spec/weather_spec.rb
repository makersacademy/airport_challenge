require 'weather'

RSpec.describe Weather do

  it "can be initialized with the probability of stormy weather" do
    expect(Weather).to respond_to(:new).with(1).argument
  end

  it "always returns weather which is either true or false i.e. stormy or not stormy" do
    expect([true, false].include?(subject.stormy?)).to eq true
  end

end
