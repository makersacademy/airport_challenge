require "airport"
require "plane"

describe Airport do

  let(:plane) {Plane.new}
  let(:airport_plane_landed) {
    subject.land(plane)
    subject
  }

  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off)}

  context "#land(plane)" do

    it "lands a plane and adds it to the hangar" do
      expect(airport_plane_landed.hangar[0]).to eq(plane)
    end

  end

  context "#take_off(plane)"

end
