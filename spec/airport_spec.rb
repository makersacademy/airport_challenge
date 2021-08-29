require "airport"

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should be able to land a plane" do
    expect(subject.land(plane)).to eq([plane])
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it "should delete a plane after takeoff" do
    expect(subject.take_off(plane)).to be nil
  end
end
