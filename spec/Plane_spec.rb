require './lib/Plane.rb'

describe Plane do
  describe "Changing Altitude" do
    it "should Land plane and confirm" do
      plane = Plane.new
      expect(plane).to respond_to(:land)
      expect(plane.land).to eql true
    end
    it "should let plane take off and confirm it" do
      plane = Plane.new
      expect(plane).to respond_to(:take_off)
      expect(plane.take_off).to eql false
    end
  end
end