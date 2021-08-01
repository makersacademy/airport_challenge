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
        takeoff_test = Airport.new
        allow(takeoff_test).to receive(:todays_weather).and_return(2)
        5.times {takeoff_test.land_airplane}
        expect { takeoff_test.takeoff }.to change { takeoff_test.airport.count }.from(5).to(4)
     end

    it 'Tests if an error message is generated when the airport is full' do
        full_airport = Airport.new
        allow(full_airport).to receive(:todays_weather).and_return(2)
        Airport::CAPACITY.times {full_airport.land_airplane}  
        expect{ full_airport.land_airplane }.to raise_error("No available landing spots") if (full_airport.airport.count) >= Airport::CAPACITY
    end

    it 'Tests if an error is raised when the airport is empty and a user tries to launch planbe' do
        takeoff_test = Airport.new
        allow(takeoff_test).to receive(:todays_weather).and_return(2)
        expect { takeoff_test.takeoff }.to raise_error("There are no available planes") if (takeoff_test.airport.count) == 0
    end

    it 'Tests to see if the default value is the constant capacity' do
        capacity = Airport.new
        expect( capacity.capacity).to eq(20)
    end

    it 'Tests to see if you can pass a new value as the airport capacity' do
        capacity = Airport.new(30)
        expect( capacity.capacity ).to eq(30)
    end

   it 'Checks to see if the weather is stormy and raise an error message' do
       expect {subject.todays_weather}.to raise_error("Cannot access runway due to storms") if subject.weather == 3
   end


end