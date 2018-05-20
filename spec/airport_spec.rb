require 'airport'
require 'plane'

describe Airport do
	 subject(:airport) { described_class.new }

	 it 'the airport has a default capacity' do
 		 expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
 	end

	 describe 'attributes' do
 		# Snap check for the airport attr_accessors
 		 it { is_expected.to respond_to :capacity }
 		 it { is_expected.to respond_to :capacity= }	
 		 it { is_expected.to respond_to :planes_on_the_ground }
 		 it { is_expected.to respond_to :planes_on_the_ground= }
 		 it { is_expected.to respond_to :planes_in_the_sky }
 		 it { is_expected.to respond_to :planes_in_the_sky= }

 		# Attribute Read/Write tests
 		 it 'checks that the airport is being initialized with the default capacity' do
  			 expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  		end

 			# As the system designer
 			# So that the software can be used for many different airports
 			# I would like a default airport capacity that can be overridden as appropriate
 		 it 'allows for reading and writing for :airport_capacity' do
  			 airport.capacity = 10
  			 expect(airport.capacity).to eq(10)
  		end

 		 it 'allows for reading and writing for :planes_on_the_ground' do
  			 airport.planes_on_the_ground = ['plane']
  			 expect(airport.planes_on_the_ground.pop).to eq('plane')
  		end

 		 it 'allows for reading and writing for :planes_in_the_sky' do
  			 airport.planes_in_the_sky = ['plane']
  			 expect(airport.planes_in_the_sky.pop).to eq('plane')
  		end
 	end

	 describe 'maximum_capacity tests' do
 		# As an air traffic controller 
 		# To ensure safety 
 		# I want to prevent landing when the airport is full 
 		 it 'returns true if the number of :planes_on_the_ground == :capacity' do
  			 Airport::DEFAULT_CAPACITY.times { airport.land('plane') }
  			 expect(airport.maximum_capacity?).to eq(true)
  		end

 		 it 'returns false if the number of :planes_on_the_ground < :capacity' do
  			 Airport::DEFAULT_CAPACITY.times { airport.land('plane') }
  			 airport.takeoff
  			 expect(airport.maximum_capacity?).to eq(false)
  		end
 	end

	 describe 'landing tests' do

 		 it 'raises an error if a plane tries to land when there is no space' do
      Airport::DEFAULT_CAPACITY.times { airport.land('plane') }
      expect { airport.land('MA370').to raise_error('No apron slots available') }
    end

 		 it { is_expected.to respond_to(:land).with(1).argument }

 		 it 'allows a plane to land on the runway' do
  			 plane = Plane.new
  			 expect(airport.land(plane).last).to eq plane
  		end
 	end

	 describe 'takeoff tests' do
 		# Planes on the ground
 		 it { is_expected.to respond_to :planes_on_the_ground }
 		# Planes in the sky
 		 it { is_expected.to respond_to :planes_in_the_sky }

 		# As an air traffic controller 
 		# To ensure safety 
 		# I want to prevent takeoff when weather is stormy
 		 it { is_expected.to respond_to :safe_to_takeoff? }

 	end

end
