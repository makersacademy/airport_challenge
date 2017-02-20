require 'airport'

describe Airport do
    #checks that correct plane enters airport array
    it "land a plane", :airportland do
        plane = Plane.new
        subject.land(plane)
        expect(subject.hangar).to include(plane)
    end

    #checks that correct plane leaves airport array
    it "takesoff a plane", :airportland do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.hangar).not_to include(plane)
    end

    #checks that if hangar full, planes won't land
    it "airport hangar is full", :airporthangarfull do
        fill_airport(10)
        plane = Plane.new

        allow(plane.weather).to receive(:stormy?).and_return false
        expect{plane.land(subject)}.to raise_error "The hangar is full."
        expect(subject.hangar.length).to eq 10
    end

    #checks capacity changes
    it "capacity change", :airportchangecapacity do
        airport = Airport.new(5)
        fill_airport(5)

        expect(airport.capacity).to eq 5
        expect(subject.hangar.length).to eq 5
    end

    def fill_airport(planes) #method to automatically fill airport on testing
      count = 0
      until count==planes
        plane = Plane.new
        allow(plane.weather).to receive(:stormy?).and_return false
        plane.land(subject)
        count+=1
      end
    end

end
