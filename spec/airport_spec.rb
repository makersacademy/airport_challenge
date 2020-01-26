require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land_plane) }

  it { is_expected.to respond_to(:take_off) }

  it "should return plane" do
    subject.land_plane
  end

  it "instruct planes to take off" do
    subject.take_off
  end

  it "checks if plane has taken off" do
    plane = subject.take_off
    expect(plane).to be_plane_flying?
  end

end
