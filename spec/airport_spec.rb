require 'airport'

describe Airport do
  describe "landing method" do
    it "should respond to the :land_plane method" do
      airport = Airport.new
      expect(airport).to respond_to(:land_plane)
    end
    it "should return a Plane instance when :land_plane is called on an Airport" do
      expect(subject.land_plane).to be_instance_of(Plane)
    end
  end

  describe "taking off method" do
    it "should respond to the :take_off method" do
      expect(subject).to respond_to(:take_off)
    end
    it "should output a plane when called" do
      expect(subject.take_off).to be_instance_of(Plane)
    end
  end
end
