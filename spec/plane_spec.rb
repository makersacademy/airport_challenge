require "plane"

describe Plane do

  describe "#take_off" do
    it "Changes plane's status to 'flying'" do
      plane = Plane.new
      airport = Airport.new
      subject.take_off(airport)
      expect(subject.status).to eq("flying")
    end

    it "Changes plane's location to 'in the air'" do
      plane = Plane.new
      airport = Airport.new
      subject.take_off(airport)
      expect(subject.location).to eq("in the air")
    end
  end

end
