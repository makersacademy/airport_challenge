require "weather"

describe Weather do

  it "weather can be stormy" do
    srand(1)
    expect(subject.stormy?).to eq false
  end

  it "weather can be clear" do
    srand(2)
    expect(subject.stormy?).to eq true
  end
end
