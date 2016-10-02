require 'airport'

describe Airport do


	subject(:airport) { described_class.new }
	let(:plane) { double (:plane) }
	let(:weather) { double(:weather) }
	let(:stormy_weather) { double(:weather) }



	before(:each) do
	 	@default_capacity = Airport::DEFAULT_CAPACITY
	 	@different_capacity = rand(1...@default_capacity)
	 	@error1 = 'Unsuitable weather for landing!' 
	 	@error2 = "Too stormy to take off!"
	 	@error3 = "No space for planes in airport"
	 	allow(weather).to receive(:stormy?).and_return(false)
	 	allow(stormy_weather).to receive(:stormy?).and_return(true)
	 	allow(plane).to receive(:land)
	 	allow(plane).to receive(:take_off)
	end
	
	it { is_expected.to have_attributes(landed_planes: [], capacity: @default_capacity) }

	context '#land' do

		it 'instructs the plane to land' do
			expect(plane).to receive(:land)
			airport.land(plane, weather)
		end

		it 'lands a plane at the airport' do
			airport.land(plane, weather)
			expect(airport.landed_planes).to include(plane)
		end
	end

	context '#take_off' do

		it 'instructs the plane to take off' do
			expect(plane).to receive(:take_off)
			airport.take_off(plane, weather)
		end

		it 'takes off a plan from the airport' do
			airport.take_off(plane, weather)
			expect(airport.landed_planes).to_not include(plane)
		end

	end

	context 'with stormy weather conditions' do

		it 'raises an error when trying to land' do
			expect { airport.land(plane, stormy_weather) }.to raise_error @error1
		end

		it 'allows plane to land once weather clears up' do
			expect { airport.land(plane, weather) }.to_not raise_error 
		end

		it 'raises an error when trying to take off' do
			expect { airport.take_off(plane, stormy_weather) }.to raise_error @error2
		end

		it 'allows the plane to take off once weather clears up' do
			expect { airport.take_off(plane, weather) }.to_not raise_error
		end

	end

	context 'capacity' do

		it 'returns true if airport is full' do
			airport.capacity.times { airport.land(plane,weather) }
			expect(airport.full?).to eq(true)
		end

		it 'raises an error if plane tries to land in a full airport' do
			airport.capacity.times { airport.land(plane, weather) }
			expect { airport.land(plane, weather) }.to raise_error @error3
		end 

		it 'can change from default capacity' do
			diff_cap_airport = Airport.new(@different_capacity)
			expect(diff_cap_airport.capacity).to_not eq(@default_capacity)
		end
	end

end

