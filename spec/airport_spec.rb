require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "instructs plane to land" do

    plane = Plane.new
    expect(subject.land(plane)).to eq plane

  end

  it "instructs plane to take off" do

    plane = Plane.new
    expect(subject.land(plane)).to eq plane

  end

end
