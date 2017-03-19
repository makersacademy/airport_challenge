require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it "checks plane has landed" do
    subject.land
    expect(subject.landed).to eq true
    expect(subject.in_transit).to eq false
  end

  it "checks plane has taken off" do
    subject.take_off
    expect(subject.landed).to eq false
    expect(subject.in_transit).to eq true
  end

end
