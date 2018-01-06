require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  # it "instructs a plane to take off and confirms that it is no longer in the airport" do
  #   plane = Plane.new
  #   expect(subject.take_off(plane)).to eq "#{plane} is no longer in the aiport"
  # end

  it "lands a plane and confirms that the plane is in the airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes.sample).to eq plane
  end

  it "checks that a plane has left the aiport after take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes.empty?).to eq true
  end
end
