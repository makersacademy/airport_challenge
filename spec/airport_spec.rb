require 'airport'

describe Airport do   

    describe 'Test if I can instruct an airplane can land at the airport' do
        it { is_expected. to respond_to(:land_airplane)}
    end

    it 'Tests if an airplane has landed at the airport' do
        test_landing = Airport.new
        test_landing.land_airplane
        expect(test_landing.airport).not_to be_empty
    end

    describe 'Tests if I can instruct a plane to take off' do
      it {is_expected.to respond_to(:takeoff)}
    end

    it 'Tests if an airplane has left the airport' do
        5.times {subject.land_airplane}
        expect { subject.takeoff }.to change { subject.airport.count }.from(5).to(4)
     end
end


