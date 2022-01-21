require "weather"

describe Weather do

  it "Can be stormy" do
    srand(1)
    expect(subject.stormy?).to eq false
  end

  it "Can be clear" do
    srand(2)
    expect(subject.stormy?).to eq true
  end
end
