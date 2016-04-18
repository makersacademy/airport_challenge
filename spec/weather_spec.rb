require "weather"
require 'rspec/expectations'

describe Weather do

  describe "#initialize" do

  end

  describe "#stormy?"

  it "it should sometimes return true" do
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.stormy?).to eq true
  end

  it "it should sometimes return false" do
    allow(subject).to receive(:rand).and_return(4)
    expect(subject.stormy?).to eq false
  end
end
