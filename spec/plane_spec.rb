require 'plane'

describe Plane do
  let(:airport){double(:airport, :planes => [], :receive_plane => [], :release_plane => [])}
  let(:stormy){double(:stormy, :storm => true)}
  let(:sunny){double(:sunny, :storm => false)}

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).argument}
    it "reports its initial flying status" do
      expect(subject.flying).to be(true)
    end
    it "confirms landed after landing" do
      subject.takeoff(airport)
      subject.land(airport)
      expect(subject.flying).to be(false)
    end
    it "tells destination airport to receive it" do
      expect(airport).to receive(:receive_plane)
      subject.land(airport)
    end
  end

  describe "#takeoff" do
    it {is_expected.to respond_to(:takeoff).with(1).argument}
    it "confirms flying after takeoff" do
      subject.takeoff(airport)
      expect(subject.flying).to be(true)
    end
    it "tells airport to release it" do
      expect(airport).to receive(:release_plane)
      subject.takeoff(airport)
    end
  end

  describe "#storm_check" do

  end

end
