require "./lib/Air_traffic_controller.rb"

describe Air_traffic_controller do

  describe "#land_plane and landed_planes" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}
      # it "sends a message to plane to land it and a message to airport that the plane has landed" do
      #    allow(plane).to receive(:land).and_return(true)
      #    allow(airport).to receive(:list_landed_planes).and_return([plane])
      #    allow(airport).to receive(:new_plane)
      #    expected(subject.land_plane(plain, airport)).to
      #  end

      it "returns the list of landed planes" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:is_bad?).and_return(false)
        allow(airport).to receive(:is_full?).and_return(false)
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
      # it "sends a message to plane to land it and a message to airport that the plane has landed" do
      #    allow(plane).to receive(:land).and_return(true)
      #    allow(airport).to receive(:list_landed_planes).and_return([plane])
      #    allow(airport).to receive(:new_plane)
      #    expected(subject.land_plane(plain, airport)).to
      #  end

      it "returns the list of planes in flight" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:is_bad?).and_return(false)
        #allow(airport).to receive(:list_planes_in_flight).and_return([plane])
        allow(airport).to receive(:new_plane_takeoff)
        subject.takeoff_plane(plane, airport, weather)
        subject.add_to_in_flight(plane)
        expect(subject.list_planes_in_flight).to eq [plane]
      end
  end

  describe "#cannot takeoff_planes during bad weather" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks for bad weather on takeoff and returns an error if the weather is bad" do
        allow(plane).to receive(:takeoff).and_return(true)
        allow(weather).to receive(:is_bad?).and_return(true)
        #allow(airport).to receive(:list_planes_in_flight).and_return([plane])
        allow(airport).to receive(:new_plane_takeoff)
        expect{subject.takeoff_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot land_planes during bad weather" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks for bad weather on landing and returns an error if the weather is bad" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:is_bad?).and_return(true)
        #allow(airport).to receive(:is_full?).and_return(false)
        allow(airport).to receive(:new_plane_landed)
        expect{subject.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

  describe "#cannot land_planes if airport is full" do
    let(:plane) {double :plane}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

      it "checks if the airport is full on landing and returns an error if there is no more room for the plane" do
        allow(plane).to receive(:land).and_return(true)
        allow(weather).to receive(:is_bad?).and_return(false)
        allow(airport).to receive(:is_full?).and_return(true)
        allow(airport).to receive(:new_plane_landed)
        expect{subject.land_plane(plane, airport, weather)}.to raise_error(RuntimeError)
      end
  end

end
