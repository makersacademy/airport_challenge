# Airport Challenge User Stories
describe 'user stories' do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    let(:weather) {Weather.new}

    context 'weather not stormy' do
        before do
            allow(airport).to receive(:stormy?) { false }
        end
        # User Story 1
        # As an air traffic controller 
        # So I can get passengers to a destination 
        # I want to instruct a plane to land at an airport

        it 'instructs plane to land at airport' do
            expect { airport.land(plane) }.not_to raise_error
        end

        # User Story 2
        # As an air traffic controller 
        # So I can get passengers on the way to their destination 
        # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

        it 'instructs a plane to take off and confirms the departure' do
            allow(airport.landed).to receive(:include?) { true }
            expect { airport.take_off(plane) }.not_to raise_error
            expect { airport.take_off(plane) }.to output("Take-off: Successful\n").to_stdout
        end
    end

    context 'when weather is stormy' do
        before do
         allow(airport).to receive(:stormy?) { true }
        end
        # User Story 3
        # As an air traffic controller 
        # To ensure safety 
        # I want to prevent takeoff when weather is stormy 

        it 'prevents plane taking off' do
            expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Weather is stormy'
        end
    

        # User Story 4
        # As an air traffic controller 
        # To ensure safety 
        # I want to prevent landing when weather is stormy 

        context 'when weather is stormy' do
            it 'prevents plane landing' do
                expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy'
            end
        end
    end

        # User Story 5
        # As an air traffic controller 
        # To ensure safety 
        # I want to prevent landing when the airport is full 

        context 'when airport is full' do
            it 'prevents landing' do
                allow(airport).to receive(:stormy?) { false }
                20.times { airport.land(plane) }
                expect { airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
            end
        end

        # User story 6
        # As the system designer
        # So that the software can be used for many different airports
        # I would like a default airport capacity that can be overridden as appropriate

        it 'allows a default airport capacity to be overidden to 2' do
            expect(Airport.new(2).capacity).to eq 2
        end
        it 'allows a default airport capacity to be overidden to 5' do
            expect(Airport.new(5).capacity).to eq 5
        end

        # Extra cases and edge cases
        # 7. planes can only take off from airports they are in;
        it "doesn't allow take-off, if plane not at airport" do
            
            jfk = Airport.new
            htw = Airport.new
            plane1 = Plane.new
            plane2 = Plane.new
            allow(jfk).to receive(:stormy?).and_return false
            allow(htw).to receive(:stormy?).and_return false
            jfk.land(plane1)
            htw.land(plane2)
            expect { htw.take_off(plane1) }.to raise_error 'Cannot take-off: Not at this airport'
        end
        # 8. planes that are already flying cannot take off and/or be in an airport;
        
        
        # 9. planes that are landed cannot land again and must be in an airport, etc.

end