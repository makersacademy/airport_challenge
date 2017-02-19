require 'plane'

describe Plane do

    #checks that plane has entered the airport and is no longer flying
    it "land a plane", :planeland do
        airport = Airport.new
        #11.times {subject.land(airport)}
        subject.land(airport)
        expect(subject.flying).to eq false
        expect(subject.airport).to eq airport
        #expect(airport.hangar).to include(subject)
end
    #checks that plane has left the airport and is now flying
    it "takeoff a plane", :planetakeoff do
        airport = Airport.new
        subject.land(airport) #lands the plane for test to run
        subject.takeoff(airport)

        expect(subject.flying).to eq true
        expect(subject.airport).to eq nil
        #expect(airport.hangar).not_to include(subject)
    end

end
