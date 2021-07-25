require 'airport'
require 'plane'
  describe 'ATC assessing landing and takeoff if stormy' do
   #call prevent landing when stormy then do not land if true, else land, set airport variable, , set landed/flying variable
    it 'ATC tells the plane to land at the airport when not stormy and confirm landing' do
      airport1 = Airport.new
      #plane1 = Plane.new
      @@array_of_planes = [[0020, "flying", 0100]]
      expect(airport1.instructlanding_at_airport(9, 0020, 0100)).to eq(true) 
    end

    it 'ATC tells the plane not land at the airport when it is stormy' do
      airport = Airport.new
      airport1 = Airport.new
      #plane1 = Plane.new
      @@array_of_planes = [[0020, "flying", 0100]]
      expect(airport1.instructlanding_at_airport(10, 0020, 0100)).to eq(false)
    end

    it 'ATC tells the plane to take off from the airport when not stormy and confirm takeoff' do
      airport1 = Airport.new
      #plane1 = Plane.new
      @@array_of_planes = [[0020, "landed", 0100]]
      expect(airport1.instruct_takeoff_from_airport(9, 0020, 0100)).to eq(true)
    end

    it 'ATC tells the plane to take off from the airport when it is stormy and is told it cannot' do
      airport = Airport.new
      airport1 = Airport.new
      #plane1 = Plane.new
      @@array_of_planes = [[0020, "landed", 0100]]
      expect(airport1.instruct_takeoff_from_airport(10, 0020, 0100)).to eq(false)
    end

  end

  describe 'ATC ensuring that if capacity full at airport landing does not take place' do

    it 'ATC prevents landing when the airport is full (default capacity)' do
      airport1 = Airport.new
      airport2 = Airport.new
      #initiates a single plane with the following criteria
      plane1 = airport1.newplane
      @@array_of_planes[0] = [0021, "flying", 0100]
      #@array_of_planes[0][1] = "flying"
      #set airport2 be full - potential to take away assumption this will be always 20 by assigning @capacity.
      20.times do (airport2.newplane) end
      #900 is default airport id
      expect(airport2.instructlanding_at_airport(9, 0021, airport2.object_id)).to eq(false)
    end

    it 'ATC allows landing when the airport is not full (default capacity)' do
      airport1 = Airport.new
      airport2 = Airport.new
      #initiates a single plane with the following criteria
      plane1 = airport1.newplane
      @@array_of_planes = [[0020, "flying", 0100]]
      expect(airport2.instructlanding_at_airport(4, 0020, airport1.object_id)).to eq(true)
    end

    it 'ATC prevents landing when the airport is full (overridden capacity)' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport2.override_capacity(10)
      #initiates a single plane with the following criteria
      plane1 = airport1.newplane
      @@array_of_planes = [[0020, "flying", 0100]]
      #set airport2 be full - potential to take away assumption this will be always 20 by assigning @capacity.
      10.times do (airport2.newplane) end
      #900 is default airport id
      expect(airport2.instructlanding_at_airport(9, 0020, airport2.object_id)).to eq(false)
    end
  
    it 'ATC allows landing when the airport is not full (overridden capacity)' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport2.override_capacity(1)
      #initiates a single plane with the following criteria
      plane1 = airport1.newplane
      @@array_of_planes = [[0020, "flying", 0100]]
      expect(airport2.instructlanding_at_airport(4, 0020, airport1.object_id)).to eq(true)
    end

  end

# EDGE CASES from challenge
  describe 'planes that are flying cannot takeoff, and planes that are landed must be in an airport' do
    it 'the plane that is flying cannot take off' do
        airport = Airport.new
        airport1 = Airport.new
        #plane1 = Plane.new
        @@array_of_planes = [[0020, "flying", 0100]]
        expect {airport1.instruct_takeoff_from_airport(9, 0020, 0100)}.to raise_error("the plane is flying, cannot take off")
      end
    it 'the plane that is already landed, cannot be instructed to land' do
        airport = Airport.new
        airport1 = Airport.new
        #plane1 = Plane.new
        @@array_of_planes = [[0020, "landed", 100]]
        expect {airport1.instructlanding_at_airport(9, 0020, 100)}.to raise_error("the plane is already landed")
    end
  end
  
   
 