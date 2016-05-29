require 'airport.rb'

describe "Airport" do 
  subject(:airport) { Airport.new }

  
  describe "#take off" do 

    it "cannot take off if no planes" do
    	expect {airport.depart}.to raise_error("No planes")
    end

    it "plane takes off" do
      expect(airport).to respond_to(:depart)
    end

    context "adding weather for taking off" do 

      it "plane is no longer at the airport after taking off" do
        airport.stub(:stormy?) { false }
      	plane = airport.land(Plane.new)
      	expect(airport.depart).to eq false
      end

      it "takes off in good weather" do 
        airport.stub(:stormy?) { false }
        expect(airport).to respond_to(:depart)
      end

      it "does not take off in bad weather" do
        airport.stub(:stormy?) { true }
        expect{airport.land(Plane.new)}.to raise_error("Bad weather")
      end
    end
  end 

  describe "#land" do

    it "lands planes" do
    	expect(airport).to respond_to(:land).with(1).argument
    end
      
    it "plane has landed in good weather" do
      airport.stub(:stormy?){ false }
    	plane = airport.land(Plane.new)
    	expect(plane.pop.airport).to eq true
    end

    it "cannot land if there is no space" do 
      airport.stub(:stormy?){ false }
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error "Airport is full"
    end

    context "adding weather to landing" do 

      it "cannot land in stormy weather" do 
        airport.stub(:stormy?){ true }
        expect{airport.land(Plane.new)}.to raise_error("Bad weather")
      end

      it "shows planes that have landed" do
        expect(airport).to respond_to(:planes)
      end
    end
  end

  describe "initialization" do 
      
    it "has default capacity" do 
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end 

    it "can set capacity" do 
      expect(Airport.new(50).capacity).to eq 50
    end 
  end
end

