require 'plane'

describe Plane do
  let(:airport){double(:airport, planes:[],receive_plane:[],release_plane:[],full?:false)}
  let(:full_airport){double(:full_airport,planes:[],receive_plane:[],full?:true)}


  describe "#land" do
    it "reports its initial flying status" do
      expect(subject.flying).to be(true)
    end
    it "confirms landed after successful landing" do
      allow(subject).to receive(:storm_check){false}
      subject.takeoff(airport)
      subject.land(airport)
      expect(subject.flying).to be(false)
    end
    it "tells destination airport to receive it" do
      allow(subject).to receive(:storm_check){false}
      expect(airport).to receive(:receive_plane)
      subject.land(airport)
    end
    it "stops landing if stormy" do
      allow(subject).to receive(:storm_check){true}
      expect{subject.land(airport)}.to raise_error("Cannot land in stormy weather.")
    end
    it "stops landing if airport full" do
      allow(subject).to receive(:storm_check){false}
      expect{subject.land(full_airport)}.to raise_error("Cannot land if airport is full.")
    end
  end

  describe "#takeoff" do
    it {is_expected.to respond_to(:takeoff).with(1).argument}
    it "confirms flying after successful takeoff" do
      allow(subject).to receive(:storm_check){false}
      subject.takeoff(airport)
      expect(subject.flying).to be(true)
    end
    it "tells airport to release it" do
      allow(subject).to receive(:storm_check){false}
      expect(airport).to receive(:release_plane)
      subject.takeoff(airport)
    end
    it "stops takeoff if stormy" do
      allow(subject).to receive(:storm_check){true}
      expect{subject.takeoff(airport)}.to raise_error("Cannot take off in stormy weather.")
    end
  #  it "raises an error if plane is told to take off from airport it's not at" do
  #    allow(subject).to receive(:storm_check){false}
  #    expect{subject.takeoff(airport)}.to raise_error("I'm not there!")
  #  end
  end

end
