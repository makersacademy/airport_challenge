require "airport"

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should be able to land a plane" do
    expect(subject.land(plane)).to eq([plane])
  end

  it "should return an error if there is no more space for new planes to land" do
    20.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Hangar is full, can't land"
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it "should delete a plane after takeoff" do
    expect(subject.take_off(plane)).to be nil
  end
end
