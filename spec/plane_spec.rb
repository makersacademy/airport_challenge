require 'plane'
describe Plane do

  describe '#land' do

    # test described in Steps 10 & 12 in the README
    # this test is a little wonky - in no way does it confirm that the
    # plane is stored at the airport and I do not know how to do that
    it "changes status to landed and stores itself" do
      plane = Plane.new
      airport = double(:airport)
      allow(airport).to receive(:store) {[plane]}
      plane.land(airport)
      expect(plane.status).to eq "landed"
    end

  end

  describe '#takeoff' do

    # test described in Step 16 in the README
    it "changes status to flying and releases itself" do
      plane = Plane.new
      airport = double(:airport, release: [], hangar: [])
      plane.takeoff(airport)
      expect(plane.status).to eq "flying"
    end

    # test described in Step 17 in the README
    it "confirms that plane is no longer in airport" do
      plane = Plane.new
      airport = double(:airport, release: [], hangar: [])
      plane.takeoff(airport)
      expect(plane.takeoff(airport)).to eq "Take-off successful"
    end

    # test described in Step 17 in the README
    it "confirms that plane has not left the airport" do
      plane = Plane.new
      airport = double(:airport, release: [], hangar: [plane])
      plane.takeoff(airport)
      expect(plane.takeoff(airport)).to eq "Take-off not successful"
    end

  end

end
