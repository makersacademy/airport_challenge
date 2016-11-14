require 'weather'

describe Weather do
  let(:airport) { Class.new { include Weather } }

  it "The weather can be stormy" do
    heathrow = airport.new
    srand(17)
    expect(heathrow.stormy?).to eq true
  end

  it "The weather can be not-stormy" do
    heathrow = airport.new
    srand(3)
    expect(heathrow.stormy?).to eq false
  end


end
