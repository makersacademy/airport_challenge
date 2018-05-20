require 'airport'
require 'plane'
require 'weather'

describe Airport do
	subject(:airport) { described_class.new }
	let(:plane) { Plane.new }


	it 'the airport has a default capacity' do
 		expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
 	end


	describe 'attributes' do

 		it 'checks that the airport is being initialized with the default capacity' do
  			expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  		end

 		it 'allows for reading and writing for :airport_capacity' do
  			airport.capacity = 10
  			expect(airport.capacity).to eq(10)
  		end

 		it 'allows for reading and writing for :planes_on_the_ground' do
  			airport.planes_on_the_ground = [plane]
  			expect(airport.planes_on_the_ground.pop).to eq(plane)
  		end

 		it 'allows for reading and writing for :planes_in_the_sky' do
  			airport.planes_in_the_sky = [plane]
  			expect(airport.planes_in_the_sky.pop).to eq(plane)
  		end
 	end


	describe 'maximum_capacity tests' do
  		it 'returns true if the number of :planes_on_the_ground == :capacity' do
  			allow(airport).to receive(:stormy?).and_return false
  			Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
  			expect(airport.maximum_capacity?).to eq(true)
  		end

  		it 'returns false if the number of :planes_on_the_ground < :capacity' do
  			allow(airport).to receive(:stormy?).and_return false
  			Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
  			airport.takeoff(plane)
  			expect(airport.maximum_capacity?).to eq(false)
  		end	
	end


	describe 'landing tests' do
  		it 'raises an error if a plane tries to land when there is no space' do
  			allow(airport).to receive(:stormy?).and_return false
      		Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      		expect { airport.land(plane).to raise_error('No apron slots available') }
    	end

  		it { is_expected.to respond_to(:land).with(1).argument }

  		it 'allows a plane to land at the airport' do
  			allow(airport).to receive(:stormy?).and_return false
  			expect(airport.land(plane).last).to eq plane
  		end

		it 'prevents a plane from landing when weather is stormy' do
			allow(airport).to receive(:stormy?).and_return true
      		expect { airport.land(plane).to raise_error('Cannot land when stormy') }
  		end	
	end


 	describe 'weather tests' do
 		it 'asks someone to look out the window and check the weather' do
 			allow(airport).to receive(:stormy?).and_return false
 			expect(airport.stormy?).to eq(false)
  		end
 	end


	describe 'takeoff tests' do
  		it { is_expected.to respond_to(:takeoff).with(1).argument }

  		it 'prevents a plane from taking off when weather is stormy' do
  			allow(airport).to receive(:stormy?).and_return true
      		expect { airport.takeoff.to raise_error('Cannot takeoff when stormy') }
      	end

      	it 'checks if a plane is in the airport' do
      		allow(airport).to receive(:stormy?).and_return false
        	expect { airport.takeoff(plane) }.to raise_error 'Plane is no longer in the airport'
      end
	end

	# Your code should defend against edge cases such as
	# inconsistent states of the system ensuring that planes
	# can only take off from airports they are in; planes
	# that are already flying cannot takes off and/or be in
	# an airport; planes that are landed cannot land again
	# and must be in an airport, etc.

end
