require 'airport'

describe Airport do

    describe "#instruct_land" do
      let(:plane_air) { double :plane_air, landed?: false }
      let(:plane_landed) { double :plane_landed, landed?: true }

      it "can tell a plane to land" do
        expect(subject).to respond_to(:land_plane)
      end
      it "get the plane reference back if the weather is sunny" do
        allow(subject).to receive(:sunny?) {true}
        expect(subject.land_plane(plane_air)).to eq plane_air
      end
      it "raise an error if the weather is stormy" do
        allow(subject).to receive(:sunny?) {false}
        expect{subject.land_plane(plane_air)}.to raise_error("The weather at the airport is stormy, you cannot land.")
      end
      it "raise an error if the plane passed is already landed" do
        expect{subject.land_plane(plane_landed)}.to raise_error("This plane is already on the ground.")
      end
      it "raise an error if the airport is full" do
        subject.capacity.times {subject.land_plane(double :plane, landed?:false)}
        expect{subject.land_plane(double :plane, landed?: false)}.to raise_error("Sorry, this airport is full.")
      end
    end

    describe "#permit_takeoff" do
      let(:plane_air) { double :plane_air, landed?: false }
      let(:plane_landed) { double :plane_landed, landed?: true }
      let(:plane_to_remove) { double :plane_to_remove, landed?: false }

      it "can tell a plane to takeoff" do
        expect(subject).to respond_to(:permit_takeoff)
      end
      it "get the plane reference back if the weather is sunny" do
        allow(subject).to receive(:sunny?) {true}
        expect(subject.permit_takeoff(plane_landed)).to eq plane_landed
      end
      it "raise an error if the weather is stormy" do
        allow(subject).to receive(:sunny?) {false}
        expect{subject.permit_takeoff(plane_landed)}.to raise_error("The weather at the airport is stormy, you cannot takeoff.")
      end
      it "raise an error if the plane passed is already in the air" do
        expect{subject.permit_takeoff(plane_air)}.to raise_error("This plane is already in the air.")
      end

      it "raise an error if the plane passed is landed but not at this airport" do
        expect{subject.permit_takeoff(plane_air)}.to raise_error("This plane is at a different airport.")
      end

      it "takes the plane out of the airport if it has taken off" do
        allow(subject).to receive(:sunny?) {true}
        subject.land_plane(plane_to_remove)
        allow(plane_to_remove).to receive(:landed?) {true}
        subject.permit_takeoff(plane_to_remove)
        expect(subject.planes.length).to eq 0
      end
    end

end
