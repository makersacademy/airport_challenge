require "./lib/Air_traffic_controller.rb"

describe Air_traffic_controller do
  subject(:air_traffic_controller) { described_class.new }

  describe "#land_plane and landed_planes" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "returns the list of landed planes" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:full?).and_return(false)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:new_plane_landed)
        subject.land_plane(plane, airport, weather)
        expect(subject.landed_planes(airport)).to eq [plane]
      end
  end

  describe "#takeoff_plane and planes_in_flight" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "can ask a plane to take off" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:new_plane_takeoff)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:check_list).and_return(true)
        subject.takeoff_plane(plane, airport, weather)

      end

      it "returns the list of planes in flight" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:new_plane_takeoff)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:check_list).and_return(true)
        subject.takeoff_plane(plane, airport, weather)
        expect(subject.list_planes_in_flight).to eq [plane]
      end

  end

  describe "#cannot takeoff_planes during bad weather" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks on takeoff and returns an error if the weather is bad" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(true)
        allow(airport).to receive(:list_landed_planes).and_return([plane])
        allow(airport).to receive(:new_plane_takeoff)
        expect{subject.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot takeoff_planes if not at the airport" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks on takeoff and returns error if the plane is not at airport" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:list_landed_planes).and_return([nil])
        allow(airport).to receive(:new_plane_takeoff)
        expect{subject.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot land_planes during bad weather" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks on landing and returns an error if the weather is bad" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:bad?).and_return(true)
        allow(airport).to receive(:new_plane_landed)
        expect{subject.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot land_planes if airport is full" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks on landing and returns an error if the airport is full" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:full?).and_return(true)
        allow(airport).to receive(:new_plane_landed)
        expect{subject.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot take off planes if not at airport" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks on takeoff and returns an error if plane is not at airport" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:bad?).and_return(false)
        allow(airport).to receive(:full?).and_return(false)
        allow(airport).to receive(:new_plane_landed)
        allow(airport).to receive(:list_landed_planes).and_return([])
        expect{subject.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

end
