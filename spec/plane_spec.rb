require "plane"

describe "Plane" do
  describe "#working?" do
    it "should return true when working is called" do
      plane = Plane.new
      expect(plane.working?).to(eq(true))
    end
  end    
end
