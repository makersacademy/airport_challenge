require 'plane'

describe Plane do
  let(:airport){double(:airport, :planes => [], :receive_plane => [], :release_plane => [])}

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).argument}
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
      expect(airport).to receive(:receive_plane)
      subject.land(airport)
    end
    it "stops landing if stormy" do
      allow(subject).to receive(:storm_check){true}
      expect{subject.land(airport)}.to raise_error("Cannot land in stormy weather.")
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
      expect(airport).to receive(:release_plane)
      subject.takeoff(airport)
    end
    it "stops takeoff if stormy" do
      allow(subject).to receive(:storm_check){true}
      expect{subject.takeoff(airport)}.to raise_error("Cannot take off in stormy weather.")
    end
  end

  describe "#storm_check" do

  end

end
