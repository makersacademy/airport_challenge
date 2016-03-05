require 'plane'

describe Plane do

  describe "takeoff sequence: " do

    it "can be instructed to land at the airport" do
      expect(subject).to respond_to(:land)
    end

    it "can be verified as landed" do
      subject.land
      expect(subject.has_landed?).to eq true
    end

  end

end
