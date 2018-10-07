require 'weather'

describe Weather do

  it "sometimes weather is stormy (25% of the time)" do
    allow(Weather).to receive(:rand) { 20 }
    expect(Weather.stormy?).to eq(true)
  end

  it "sometimes weather is fine (75% of the time)" do
    allow(Weather).to receive(:rand) { 70 }
    expect(Weather.stormy?).to eq(false)
  end

end
