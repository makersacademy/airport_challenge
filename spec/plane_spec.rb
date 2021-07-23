require "plane"

describe "Plane" do
    it "should return true when working is called" do
      plane = Plane.new
      expect(plane.working?).to(eq(true))
    end
    
    it "should return true when empty? is called after takeoff" do
    end
end
