require 'plane2'

RSpec.describe Plane do

  describe "#land" do

  airport = Airport.new
  plane = Plane.new

    it "lands at the airport" do
      Airport.any_instance.stub(:stormy?) {false}
      Airport.any_instance.stub(:full?) {false}

      plane.land(airport)
      expect(airport.landed_planes).to include(plane)
    end

    it "does not land if airport is full" do
        Airport.any_instance.stub(:stormy?) {false}
        Airport.any_instance.stub(:full?) {true}

        expect{plane.land(airport)}.to raise_error "Airport is full"
    end

    it "does not land if airport is stormy" do
      Airport.any_instance.stub(:stormy?) {true}
      Airport.any_instance.stub(:full?) {false}

      expect{plane.land(airport)}.to raise_error "Airport is stormy"
    end

    # it "cannot land if already landed" do
    #   Airport.any_instance.stub(:stormy?) {false}
    #   Airport.any_instance.stub(:full?) {false}
    #
    #   plane1 = Plane.new
    #   airport1= Airport.new
    #   plane1.land(airport1)
    #   airport2 = Airport.new
    #
    #   expect{plane1.land(airport2)}.to raise_error "Plane has already landed"
    # end

  end

  describe "#take_off" do

  airport = Airport.new
  plane = Plane.new

    it "takes off from airport and sends confirmation" do
      Airport.any_instance.stub(:stormy?) {false}
      Airport.any_instance.stub(:full?) {false}
      airport = Airport.new(15)
      plane.land(airport)
      plane.take_off(airport)
      expect(airport.capacity).to eq 15
      expect(airport.landed_planes.include?(plane)).to eq false
    end
    #
    # it "only takes off from airports they are in" do
    #
    # end


    it "does not take off if airport stormy" do
      airport = Airport.new
      plane = Plane.new
      Airport.any_instance.stub(:stormy?) {false}
      Airport.any_instance.stub(:full?) {false}
      plane.land(airport)
      Airport.any_instance.stub(:stormy?) {true}
      expect{plane.take_off(airport)}.to raise_error "Airport is stormy"
    end


    # it "cannot take off if already flying " do
    #
    # end
  end

end
