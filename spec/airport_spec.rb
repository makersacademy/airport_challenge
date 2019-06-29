require 'airport'

describe Airport do

  describe "#runway_land" do
    it "allows planes to land on it" do
      plane1 = instance_double('Airplane')
      expect(subject.runway_land(plane1)).to include(plane1)
    end
  end

  describe "#runway_takeoff" do
    it "allows the plane to takeoff" do
      plane1 = instance_double('Airplane')
      subject.runway_land(plane1)
      expect(subject.runway_takeoff(plane1)).not_to include(plane1)
    end
  end

end
