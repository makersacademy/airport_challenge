require "Airport"

describe Airport do

  let (:plane) {double :plane}

  describe "#land" do

    it "has the method" do

    end

    it "makes sure the incoming object is a plane" do

    end

    it "stores plane into planes_in_airport" do
      subject.land(plane)
      expect(subject.landed_planes).to eq([plane])
    end


  end

end
