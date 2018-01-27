require "airport"
require "plane"

describe Airport do

  let(:plane) {Plane.new}
  let(:airport_plane_landed) {
    subject.land(plane)
    subject
  }
  let(:aiport_plane_takes_off) {
    airport_plane_landed.take_off
    airport_plane_landed
  }

  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off).with(1).argument}

  context "#land(plane)" do

    it "lands a plane and adds it to the hangar" do
      expect(airport_plane_landed.hangar[0]).to eq(plane)
    end

  end

  context "#take_off(plane)" do

    it "allows a plane to take off and removes it from the hangar" do
      expect(aiport_plane_takes_off.hangar).not_to include(plane)
    end

  end

end
