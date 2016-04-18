require "weather"
require "airport"

describe Weather do

  it { expect(subject).to respond_to(:new_day) }

  it "random weather generator should return either sunny or stormy" do
    expect(subject.new_day).to eq("Stormy").or(eq("Sunny"))
  end
end
