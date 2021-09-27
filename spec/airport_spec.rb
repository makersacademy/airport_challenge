require 'airport'

RSpec.describe Airport do
	 describe '#initialize' do
		  it 'allows user to set airport capacity and be overridden' do
			   port = Airport.new(200)
			   expect(port.capacity).to eq 200
		  end
	 end

	 describe '#full?' do
			it 'returns true or false if airport is full' do
				plane = Plane.new
				airport = Airport.new(1)
				airport.successfully_land(plane)
				expect(airport.full?).to eq true
			end 
	 end

	 describe '#successfully_land' do
			it 'lands plane at airport by adding it to list' do
				airport = Airport.new
				plane = Plane.new
				airport.successfully_land(airport)
				expect(airport.planes_at_airport).to contain_exactly(airport)
			end
		
			it 'raises an error when plane tries landing in a full airport' do
				plane = Plane.new
				subject.capacity.times { subject.successfully_land Plane.new }
				expect { subject.successfully_land(plane) }.to raise_error 'airport is full'
			end
	 end

	 describe '#successful_takeoff' do
		 	it 'confirms plane has left airport' do
				 plane = Plane.new
				 subject.successfully_land(plane)
				 subject.successful_takeoff(plane)
				expect(subject.planes_at_airport).to_not include plane
			end
	 end

	 describe '#prevent landing and takeoff' do
			it 'raises an error when weather is too stormy for airplane takeoff' do 
				allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
				plane = Plane.new
				subject.successfully_land(plane)
				expect { subject.stop_takeoff(plane) }.to raise_error 'Unable to take off due to stormy weather'
			end

			it 'raises an error when weather is too stormy for airplane landing' do 
				allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
				plane = Plane.new
				expect { subject.stop_landing(plane) }.to raise_error 'Unable to land plane at airport due to stormy weather'
			end
	 end
end
