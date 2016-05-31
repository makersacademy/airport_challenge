require 'airport.rb'

describe "Airport" do 
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:stormy_weather) { double :weather, stormy?: true }
  let(:good_weather) { double :weather, stormy?: false}

  
  describe "#take off" do 

    it "cannot take off if no planes" do
    	expect {airport.depart(good_weather)}.to raise_error("No planes")
    end

    it "plane takes off" do
      expect(airport).to respond_to(:depart)
    end

    context "adding weather for taking off" do 

      it "takes off in good weather and plane no longer at airport" do 
        airport.land(plane, good_weather)
        expect(airport.depart(good_weather)).to be false
      end

      it "does not take off in bad weather" do
        expect{airport.land(plane, stormy_weather)}.to raise_error("Bad weather")
      end
    end
  end 

  describe "#land" do

    it "lands planes" do
    	expect(airport).to respond_to(:land).with(2).argument
    end
      
    it "plane has landed in good weather" do
    	expect(airport.land(plane, good_weather).pop.airport).to eq true
    end

    it "cannot land if there is no space" do 
      Airport::DEFAULT_CAPACITY.times { airport.land(plane, good_weather) }
      expect{ airport.land(plane, good_weather) }.to raise_error "Airport is full"
    end

    context "adding weather to landing" do 

      it "cannot land in stormy weather" do 
        expect{airport.land(plane, stormy_weather)}.to raise_error("Bad weather")
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

