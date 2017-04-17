require "./lib/Air_traffic_controller.rb"

describe Air_traffic_controller do
  subject(:controller) { described_class.new }

  context "#Planes takeoff" do

    describe "#takeoff_plane and planes_in_flight" do
      let(:plane) {double :plane}
      let(:airport) {double :airport}
      let(:weather) {double :weather}

      before do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:new_plane_takeoff)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:check_list).and_return(true)
      end

      it "can ask a plane to take off" do
        controller.takeoff_plane(plane, airport, weather)
      end

      it "returns the list of planes in flight" do
        controller.takeoff_plane(plane, airport, weather)
        expect(controller.list_planes_in_flight).to eq [plane]
      end

      it "checks on takeoff and returns an error if the weather is bad" do
        allow(weather).to receive(:bad?).and_return(true)
        expect{controller.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end

      it "checks on takeoff and returns error if the plane is not at airport" do
        allow(airport).to receive(:list_landed_planes).and_return([nil])
        expect{controller.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end

      it "checks on takeoff and returns an error if plane is not at airport" do
        allow(airport).to receive(:new_plane_landed)
        allow(airport).to receive(:list_landed_planes).and_return([])
        expect{controller.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
    end
  end

  context "Planes landing" do

    describe "#land_plane and landed_planes" do
      let(:plane) {double :plane}
      let(:airport) {double :airport}
      let(:weather) {double :weather}

      before do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:full?).and_return(false)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:new_plane_landed)
      end

      it "returns the list of landed planes" do
        controller.land_plane(plane, airport, weather)
        expect(controller.landed_planes(airport)).to eq [plane]
      end

      it "checks on landing and returns an error if the weather is bad" do
        allow(weather).to receive(:bad?).and_return(true)
        expect{controller.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end

      it "checks on landing and returns an error if the airport is full" do
        allow(airport).to receive(:full?).and_return(true)
        expect{controller.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
    end
  end
end
