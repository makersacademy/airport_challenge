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

    it 'Tests if an error message is generated when the airport is full' do
        Airport::CAPACITY.times {subject.land_airplane}  
        expect{ subject.land_airplane }.to raise_error("No available landing spots") if (subject.airport.count) >= Airport::CAPACITY
    end

    it 'Tests to see if the default value is the constant capacity' do
        capacity = Airport.new
        #expect { subject.capacity.count }.to eq(20)
        expect( capacity.capacity).to eq(20)
    end

    it 'Tests to see if you can pass a new value as the airport capacity' do
        capacity = Airport.new(30)
        expect( capacity.capacity ).to eq(30)
    end

    it 'Checks to see if the weather is stormy' do
        expect {subject.todays_weather}.to eq("stormy") if (subject.weather) == 3
    end

    it 'Raises an error if a plane tries to take off in stormy weather' do
        expect {subject.takeoff}.to raise_error("Cannot takeoff, too stormy") if subject.todays_weather == "stormy"
    end

end
