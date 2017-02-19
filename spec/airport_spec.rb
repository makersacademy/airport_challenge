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
    end

    # it "puts the correct plane in the hangar", :hangar_check do
    #     plane = Plane.new
    #     subject.land(plane)
    #     expect(subject.hangar).to include plane
    # end

    # #checks that the plane can takeoff
    # it "takeoff a plane", :airporttakeoff do
    #
    # end

    #checks that plane has left array

    #checks that plane doesn't land when airport reaches capacity

    #checks that default capacity is 10

    #checks that, if set to 20, capacity changes to 20

# end
