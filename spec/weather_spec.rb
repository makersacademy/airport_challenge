require 'weather'

describe Weather do

  it "returns true if passed a value <= 25" do
    allow(Weather).to receive(:rand) {20}
    expect(Weather.stormy?).to eq(true)
  end

  it "returns false if passed a value > 25" do
    allow(Weather).to receive(:rand) {70}
    expect(Weather.stormy?).to eq(false)
  end


end
