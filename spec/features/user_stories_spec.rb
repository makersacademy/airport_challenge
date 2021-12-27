require 'airport'
require 'plane'

describe "User stories/Feature tests" do
    # set up a double for the plane object
    let(:plane) { Plane.new }

    # set up a double for the airport object
    let(:airport) { Airport.new(20) }

    context 'when not stormy' do
        before do
          allow(airport).to receive(:stormy?).and_return false
        end

        it "so that planes land at airport, instruct a plane to land" do 
            # airport = Airport.new(20)
            # plane = Plane.new 
            expect { airport.land(plane) }.not_to raise_error 
        end 
        

        it "instruct a plane to take off from airport and confirm that it is no longer in the airport" do 
            # airport = Airport.new(20)
            # plane = Plane.new 
            expect { airport.take_off(plane) }.not_to raise_error
        end 

        context 'when airport is full' do
            it "does not allow planes to land when airport is full" do 
                # airport = Airport.new(20)
                # plane = Plane.new
                20.times do 
                    airport.land(plane)
                end 
                expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
            end 

            it "the airport has a default capacity" do
                # plane = Plane.new
                Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
                expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
            end 
        end 
    end 

    # prevent land or take_off when weather is stormy
    context 'when weather is stormy' do
        before do
            allow(airport).to receive(:stormy?).and_return true
        end

        it 'does not allow planes to land' do
            expect { airport.land(plane) }.to raise_error 'Weather is stormy, cannot land the plane'
        end

        it 'does not allow planes to take off' do
            expect { airport.take_off(plane) }.to raise_error 'Weather is stormy, cannot take off the plane'
        end
    end

end 