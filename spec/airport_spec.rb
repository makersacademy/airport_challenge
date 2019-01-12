require 'airport'

describe Airport do 
	context "respond to methods" do
		it "responds to landing and takeoff" do
      expect(subject).to respond_to(:land)
      expect(subject).to respond_to(:takeoff)
    end
  end

  context "check land" do
  	before(:all) do 
  		@empty_hangar = Airport.new
  		@plane = Plane.new
  		@empty_hangar.land(@plane)
  	end
    it "plane is in hangar when landed" do 
    	expect(@empty_hangar.instance_variable_get(:@hangar)).to eq [@plane]
    end
  end
 
 context "check takeoff" do
 	  # creating test hangar with plane in it, then call takeoff to see what happens
  	before(:all) do 
  		@test_hangar = Airport.new
  		@plane = Plane.new
  		@test_hangar.land(@plane)
  		@test_hangar.takeoff(@plane)
  	end
    it "plane has taken off and is no longer in hanger" do 
    	expect(@test_hangar.instance_variable_get(:@hangar)).not_to include @plane
    end
  end

end