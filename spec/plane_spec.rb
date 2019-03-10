require 'plane'
describe Plane do

  describe '#land' do

    # test described in Steps 10, 12 & 22 in the README
    # this test is a little wonky - in no way does it confirm that the
    # plane is stored at the airport and I do not know how to do that
    it "changes status to landed and stores itself" do
      plane = Plane.new
      airport = double(:airport, store: [], release: [], hangar: [plane], has_space: true, check_weather: "clear")
      plane.land(airport)
      expect(plane.status).to eq "grounded"
    end

    # test described in Step 25 in the README
    it "confirms that plane has not landed at an airport in stormy weather" do
      plane = Plane.new
      airport = double(:airport, hangar: [], check_weather: "stormy")
      plane.land(airport)
      expect(plane.status).to eq "flying"
    end

    # test described in Step 28 in the README
    it "confirms that plane has not landed at an airport that is full" do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = double(:airport, hangar: [plane1], has_space: false, check_weather: "clear")
      plane2.land(airport)
      expect(plane2.status).to eq "flying"
    end

  end

  describe '#takeoff' do

    # test described in Steps 16 & 22 in the README
    it "changes status to flying and releases itself" do
      plane = Plane.new
      airport = double(:airport, store: [], release: [plane], hangar: [], check_weather: "clear")
      plane.takeoff(airport)
      expect(plane.status).to eq "flying"
    end

    # test described in Steps 17 & 22 in the README
    it "confirms that plane is no longer in airport" do
      plane = Plane.new
      airport = double(:airport, release: [plane], hangar: [], check_weather: "clear")
      plane.takeoff(airport)
      expect(plane.status).to eq "flying"
    end

    # test described in Step 23 in the README
    it "confirms that plane has not left the airport after taking off in stormy weather" do
      plane = Plane.new
      airport = double(:airport, hangar: [plane], has_space: true, store: [], check_weather: "clear")
      plane.land(airport)
      airport = double(:airport, hangar: [plane], check_weather: "stormy")
      plane.takeoff(airport)
      expect(plane.status).to eq "grounded"
    end

  end

end
