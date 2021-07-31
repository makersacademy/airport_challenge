require 'airport'

describe Airport do   

#    describe "Test if DockingStation responds to release_bike" do
#        it { is_expected.to respond_to(:release_bike) }
#      end

    describe 'Test if I can instruct an airplane can land at the airport' do
        it { is_expected. to respond_to(:land_airplane)}
    end

    it 'Tests if an airplane has landed at the airport' do
        test_landing = Airport.new
        test_landing.land_airplane
        expect(test_landing.airport).not_to be_empty
    end

    #describe 'Test if I can '

end