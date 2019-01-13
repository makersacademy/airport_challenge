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
    # put full airport capacity of planes in hangar
    before(:all) do 
  		@full_hangar = Airport.new
  		# THIS IS BROKEN. FIGURE OUT HOW TO PUSH TO ARR IN RSPEC!!!!
  		# @full_hangar.instance_variable_get(:@capacity).times{|x| :@hangar << Plane.new}
  	end
  	it "reject plane if airport is at capacity" do 
    	# expect(@full_hangar.instance_variable_get(:@hangar)).to eq [@plane]
    	p @full_hangar.instance_variable_get(:@capacity)
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

  context "default capacity" do
  	before(:all) do
  		@full_airport = Airport.new(30)
  		@default_airport = Airport.new
  	end
  	it "check that capacity can be set to maintainer input" do
  	  expect(@full_airport.instance_variable_get(:@capacity)).to eq 30
  	end
  	it "check that capacity has default value when no input given" do
  	  expect(@default_airport.instance_variable_get(:@capacity)).to eq Airport::DEFAULT_CAPACITY
    end
  end
end

