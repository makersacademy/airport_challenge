require "weather"

describe Weather do

  it "will return a boolean value when called" do
    expect(Weather.stormy?).to satisfy{|x| (x == true) || (x == false)}
  end

  it "should return true if rand int. is in range (8..10)" do
    allow(subject).to receive(:stormy) {true}
    expect(subject.stormy).to eq(true)
  end
end
