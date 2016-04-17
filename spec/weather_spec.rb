require "weather"
require 'rspec/expectations'

describe Weather do
let (:weather) {Weather.new}

  describe "#initialize" do

  end

  describe "#stormy?"

  it "it should sometimes return true" do
    allow(subject).to receive(:rand) { 1 }
    expect(weather.stormy?).to eq true
  end

  it "it should sometimes return false" do
    allow(subject).to receive(:rand) { 5 }
    expect(weather.stormy?).to eq false
  end
end
