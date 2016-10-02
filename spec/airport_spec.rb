require 'airport'

describe Airport do

	before(:each) do
	 	@default_capacity = Airport::DEFAULT_CAPACITY
	 	@error1 = 'Unsuitable weather for landing!' 
	 	@error2 = "Too stormy to take off!"
	 	@error3 = "No space for planes in airport"
	end
	
	subject(:airport) { described_class.new }
	let(:plane) { double (:plane) }
	let(:weather) { double(:weather) }


	context '#land' do

		it 'instructs the plane to land' do
			allow(weather).to receive(:stormy?).and_return(false)
			expect(plane).to receive(:land)
			airport.land(plane, weather)
		end

		it 'lands a plane at the airport' do
			allow(weather).to receive(:stormy?).and_return(false)
			allow(plane).to receive(:land)
			airport.land(plane, weather)
			expect(airport.landed_planes).to include(plane)
		end
	end

	context '#take_off' do

		it 'instructs the plane to take off' do
			allow(weather).to receive(:stormy?).and_return(false)
			expect(plane).to receive(:take_off)
			airport.take_off(plane, weather)
		end

		it 'takes off a plan from the airport' do
			allow(weather).to receive(:stormy?).and_return(false)
			allow(plane).to receive(:take_off)
			airport.take_off(plane, weather)
			expect(airport.landed_planes).to_not include(plane)
		end

	end

	context 'with stormy weather conditions' do

		it 'raises an error when trying to land' do
			allow(weather).to receive(:stormy?).and_return(true)
			expect { airport.land(plane, weather) }.to raise_error @error1
		end

		it 'allows plane to land once weather clears up' do
			allow(plane).to receive(:land)
			allow(weather).to receive(:stormy?).and_return(false)
			expect { airport.land(plane, weather) }.to_not raise_error 
		end

		it 'raises an error when trying to take off' do
			allow(weather).to receive(:stormy?).and_return(true)
			expect { airport.take_off(plane, weather) }.to raise_error @error2
		end

		it 'allows the plane to take off once weather clears up' do
			allow(plane).to receive(:take_off)
			allow(weather).to receive(:stormy?).and_return(false)
			expect { airport.take_off(plane, weather) }.to_not raise_error
		end

	end

	context 'airport capacity' do

		it 'returns true if airport is full' do
			allow(plane).to receive(:land)
			allow(weather).to receive(:stormy?).and_return(false)
			airport.capacity.times { airport.land(plane,weather) }
			expect(airport.full?).to eq(true)
		end

		it 'does raises an error if plane tries to land in a full airport' do
			allow(plane).to receive(:land)
			allow(weather).to receive(:stormy?).and_return(false)
			airport.capacity.times { airport.land(plane, weather) }
			expect { airport.land(plane, weather) }.to raise_error @error3
		end 
		
	end

end

