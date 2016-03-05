require 'plane'

describe Plane do

  describe "takeoff sequence: " do

    it "can be instructed to land at the airport" do
      expect(subject).to respond_to(:land)
    end

  end

end
