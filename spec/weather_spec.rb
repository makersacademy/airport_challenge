require 'weather'
require 'airport'

describe Weather do
  it "returns true if random number is less than 10" do
    allow(Weather).to receive(:rand) { 0.05 }
    expect(Weather.stormy?).to eq true
  end
  it "returns false if random number is over 10" do
    allow(Weather).to receive(:rand) { 0.5 }
    expect(Weather.stormy?).to eq false
  end

end
