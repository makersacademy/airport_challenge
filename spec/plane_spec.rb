require "plane"
describe Plane do 
  let :airport {double(:airport, expecting?: true, released_for_takeoff?: true)}
  
  describe "#location" do
    it "should be flying if not in an airport" do
      expect(subject.location).to eq :Flying
    end

    it "should return an airport if in one" do
      subject.land airport
      expect(subject.location).to eq airport
    end
  end

  describe "#land" do
    it "shouldn't be able to land if not flying" do
      subject.land airport
      expect {subject.land airport}.to raise_error "Already Landed"
    end
    it "should check that the plane is expected before trying to land" do
      expect(airport).to receive(:expecting?).with(subject)
      subject.land(airport)  
    end
    it "should ask the airport to land if not expected" do
      allow(airport).to receive(:expecting?) {false}
      expect(airport).to receive(:land).with(subject)
      subject.land(airport)
    end
    it "should be at the airport after landing" do
      subject.land airport
      expect(subject.location).to eq airport
    end
  end

  describe "#take_off" do
    it "shouldn't be able to take off if already flying" do
      expect {subject.take_off}.to raise_error "Already In Flight"
    end
    it "should be flying after take_off" do
      subject.land(airport)
      subject.take_off
      expect(subject.location).to eq :Flying
    end
    it "should check that it has been released for takeoff before taking off" do
      subject.land(airport)
      expect(airport).to receive(:released_for_takeoff?).with subject
      subject.take_off
    end
    it "should call released_for_takeoff if not released for takeoff" do
      allow(airport).to receive(:released_for_takeoff?) {false}
      subject.land(airport)
      expect(airport).to receive(:release_for_takeoff).with subject
      subject.take_off
    end

  end
	
end
