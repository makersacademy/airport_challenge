require "airplane"

describe Airplane do
  it "can be landed" do
    subject.land
    expect(subject.landed?).to eq true
  end
end