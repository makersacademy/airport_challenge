require_relative '../lib/plane.rb'

describe Plane do
  
  describe "creating a new Plane" do
    it "creates a new plane object" do
      expect(Plane.new).to be_instance_of Plane
    end
  end
end
