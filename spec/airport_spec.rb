require 'airport'

describe Airport do
	let(:weather_station) { double(:weather_station, poor_weather?: false)}
	let(:plane) { spy(:plane) }
	let(:airport) { described_class.new(weather_station) }


	describe '#issue_landing_permission' do
		it 'responds to `issue_landing_permission` with a passed argument' do
			expect(airport).to respond_to(:issue_landing_permission).with(1).argument 
		end

		it 'the landed plane is in the airport' do
			plane = spy(:plane)
			airport.issue_landing_permission(plane)
			expect(airport.planes).to include plane
		end

		it 'raise error if plane is already in the airport' do
			airport.issue_landing_permission(plane)
			expect { airport.issue_landing_permission(plane) }.to raise_error 'The plane is already in the airport database.'
		end

		it 'raise error if the airport is full' do
			airport.capacity.times { 
				plane = spy(:plane)
				airport.issue_landing_permission(plane) 
			}
			expect { airport.issue_landing_permission(plane) }.to raise_error 'Permission for landing denied, due to full airport capacity.'
		end

		it 'raise error if the weather does not allow for landing' do
			stormy_station = double(:weather_station, poor_weather?: true)
			airport = Airport.new(stormy_station)
			expect { airport.issue_landing_permission(plane) }.to raise_error 'Permission for take off denied, due to poor weather conditions.'
		end
	end

	describe '#issue_take_off_permission' do
		before do
			airport.issue_landing_permission(plane)
		end

		it 'instruct the plane to take_off' do
			airport.issue_take_off_permission(plane)
			expect(plane).to have_received(:take_off)
		end

		it 'plane no longer in airport database after take off' do
			airport.issue_take_off_permission(plane)
			expect(airport.planes).not_to include(plane)
		end

		it 'raise error if the plane is not in the databse' do
			airport.issue_take_off_permission(plane)
			expect { airport.issue_take_off_permission(plane) }.to raise_error 'The plane is not present in the airport database.'
		end

		it 'raise error if the weather does not allow for landing' do
			stormy_station = double(:weather_station, poor_weather?: true)
			airport = Airport.new(stormy_station)
			expect { airport.issue_take_off_permission(plane) }.to raise_error 'Permission for take off denied, due to poor weather conditions.'
		end
	end

	describe '#capacity' do
		it 'sets default capacity to 20 if no capacity is specified' do
			expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
		end

		it 'able to set airport capacity to 300' do
			airport = Airport.new(weather_station, 300)
			expect(airport.capacity).to eq 300
		end
	end
end