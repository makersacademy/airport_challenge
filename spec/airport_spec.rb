require 'airport'

describe Airport do

  let(:plane) {double(:plane)}

  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off)}

  it "has a default capacity" do
      expect(subject.capacity).to eq Airport::CAPACITY
  end

  it "plane cannot land as airport capacity is full" do
    expect{subject.land(plane)}.to raise_error("Cannot land, capacity full")
  end

  it "plane cannot land as weather now is stormy" do
    expect{subject.land(plane)}.to raise_error("Cannot land, weather is stormy")
  end

  it "plane cannot take off as weather now is stormy" do
    expect{subject.take_off(plane)}.to raise_error("Cannot take off, weather is stormy")
  end

end
