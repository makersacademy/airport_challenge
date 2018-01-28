require "airport"

describe Airport do

  let(:plane) {double('A plane')}
  let(:airport_empty) {Airport.new}
  let(:airport_plane_landed) {
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    subject
  }
  let(:airport_full) {
    allow(airport_empty).to receive(:stormy?).and_return(false)
    described_class::DEFAULT_CAPACITY.times {airport_empty.land(double('A plane'))}
    airport_empty
  }
  let(:aiport_plane_takes_off) {
    allow(airport_empty).to receive(:stormy?).and_return(false)
    airport_plane_landed.take_off(plane)
    airport_plane_landed
  }
  let(:airport_custom_capacity) {Airport.new(50)}

  context "#land(plane)" do

    it { is_expected.to respond_to(:land).with(1).argument}

    context "#stormy? = false" do

      it "lands a plane and adds it to the hangar" do
        expect(airport_plane_landed.hangar).to include(plane)
      end

      # TODO - Raises error - landed planes cannot land again

    end

    context "#stormy? = true" do

      it "plane cannot land when stormy" do
        allow(airport_empty).to receive(:stormy?).and_return(true)
        expect{airport_empty.land(plane)}.to raise_error("Stormy, cannot land!")
      end

    end

    context "#capacity - Testing capacity of airport works with landing planes" do

      it "Airport has a default capacity of 20 planes" do
        expect(airport_empty.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end

      it "Airport capacity can change if set to a different number" do
        expect(airport_custom_capacity.capacity).to eq(50)
      end

      it "Raises an error if airport is full and try to land plane" do
        expect{airport_full.land(plane)}.to raise_error("Cannot land, airport full")
      end

    end

  end

  context "#take_off(plane)" do

    it { is_expected.to respond_to(:take_off).with(1).argument}

    context "#stormy? = false" do

      it "Allows a plane to take off and removes it from the hangar" do
        expect(aiport_plane_takes_off.hangar).not_to include(plane)
      end

      it "Confirms that the plane is no longer at the airport" do
        expect{airport_plane_landed.take_off(plane)}.to output("Plane #{plane} has left the hangar\n").to_stdout
      end

      it "Raises error if plane taking off is not in the hangar" do
        allow(airport_empty).to receive(:in_hangar?).and_return(false)
        expect{airport_empty.take_off(plane)}.to raise_error("That plane is not in the hangar")
      end

    end

    context "#stormy? = true" do

      it "Doesn't allow plane to take off" do
        allow(airport_plane_landed).to receive(:stormy?).and_return(true)
        expect{airport_plane_landed.take_off(plane)}.to raise_error("Stormy, cannot take off!")
      end

    end

  end

end
