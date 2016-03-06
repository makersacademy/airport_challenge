require 'plane'

describe Plane do
  let(:airport){double(:airport, planes:[],receive_plane:[],release_plane:[],full?:false)}
  let(:full_airport){double(:full_airport,planes:[],receive_plane:[],release_plane:[],full?:true)}
  before {allow(subject).to receive_messages(storm_check:false, at_airport?:true)}
  landed_plane = Plane.new
  before {allow(landed_plane).to receive_messages(storm_check:false, at_airport?:true, flying?:false)}

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).arguments}
    it "reports its initial flying status" do
      expect(subject.flying).to be(true)
    end
    it "confirms landed after successful landing" do
      subject.land(airport)
      expect(subject.flying).to be(false)
    end
    it "tells destination airport to receive it" do
      expect(airport).to receive(:receive_plane)
      subject.land(airport)
    end
    it "stops landing if stormy" do
      allow(subject).to receive(:storm_check){true}
      expect{subject.land(airport)}.to raise_error("Cannot land in stormy weather.")
    end
    it "stops landing if airport full" do
      expect{subject.land(full_airport)}.to raise_error("Cannot land if airport is full.")
    end
    it "raises an error if plane is on the ground when told to land" do
      expect{landed_plane.land(airport)}.to raise_error("Plane is already on the ground.")
    end
  end

  describe "#takeoff" do
    it {is_expected.to respond_to(:takeoff).with(1).argument}
    it "confirms flying after successful takeoff" do
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.flying).to be(true)
    end
    it "tells airport to release it" do
      expect(airport).to receive(:release_plane)
      landed_plane.takeoff(airport)
    end
    it "stops takeoff if stormy" do
      allow(landed_plane).to receive(:storm_check){true}
      expect{landed_plane.takeoff(airport)}.to raise_error("Cannot take off in stormy weather.")
    end
    it "raises an error if plane is told to take off from airport it's not at" do
      allow(subject).to receive(:at_airport?){false}
      subject.land(airport)
      expect{subject.takeoff(full_airport)}.to raise_error("Plane is not at that airport.")
    end
    it "raises an error if plane is already in flight when told to take off" do
      allow(subject).to receive(:flying?){true}
      expect{subject.takeoff(airport)}.to raise_error("Plane is already in flight.")
    end
  end

  describe "#storm_check" do
    it {is_expected.to respond_to(:storm_check)}
    it "requests a weather check" do
      plane = Plane.new
      expect(plane.weather).to receive(:storm)
      plane.storm_check
    end
  end

  describe "#at_airport?" do
    it {is_expected.to respond_to(:at_airport?).with(1).argument}
    it "checks within airport's array for self" do
      plane = Plane.new
      expect(airport.planes).to receive(:include?)
      plane.at_airport?(airport)
    end
  end

  describe "#flying?" do
    it {is_expected.to respond_to(:flying?)}
  end
end
