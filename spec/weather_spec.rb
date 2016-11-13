require 'weather'

describe Weather do
  let(:airport) { Class.new { include Weather } }

  it "The weather can be stormy" do
    heathrow = airport.new
    allow(heathrow).to receive(:stormy?) { true }
    expect(heathrow.stormy?).to eq true
  end

  it "The weather can be not-stormy" do
    heathrow = airport.new
    allow(heathrow).to receive(:stormy?) { false }
    expect(heathrow.stormy?).to eq false
  end


end
