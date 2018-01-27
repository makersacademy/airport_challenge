require "airport"

describe Airport do

  let(:plane) {double('A plane')}
  let(:airport_empty) {Airport.new}
  let(:airport_plane_landed) {
    subject.land(plane)
    subject
  }
  let(:aiport_plane_takes_off) {
    airport_plane_landed.take_off(plane)
    airport_plane_landed
  }

  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off).with(1).argument}

  context "#land(plane)" do

    it "lands a plane and adds it to the hangar" do
      expect(airport_plane_landed.hangar[0]).to eq(plane)
    end

    context "#capacity - Testing capacity of airport works with landing planes" do

      it "Airport has a default capacity of 20 planes" do
        expect(airport_empty.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end

    end

  end

  context "#take_off(plane)" do

    it "allows a plane to take off and removes it from the hangar" do
      expect(aiport_plane_takes_off.hangar).not_to include(plane)
    end

    it "confirms that the plane is no longer at the airport" do
      expect{airport_plane_landed.take_off(plane)}.to output("Plane #{plane} has left the hangar\n").to_stdout
    end

  end

end
