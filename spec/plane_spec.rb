require "plane"

describe Plane do
  describe "#take_off" do
    it "Changes plane's status to 'flying'" do
      plane = Plane.new
      expect(subject.status).to eq("flying")

    end
  end

end
