require "airplane"

describe Airplane do
  it "can be landed" do
    subject.land
    expect(subject.landed?).to eq true
  end

  it "can take-off" do
    subject.land
    subject.take_off
    expect(subject.landed?).to eq false
  end
end