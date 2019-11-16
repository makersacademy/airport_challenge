require 'airport'

describe Airport do
	subject { Airport.new }

		it { is_expected.to respond_to :to_land }

		it { is_expected.to respond_to :take_off }

		it { is_expected. to respond_to(:to_land).with(1).argument } # responding to method 'to_land' with '1' arugument, in this case 'plane'.

		it 'return a plane object' do # plane was instructed to land.
			plane = Plane.new
			subject.to_land(plane)
			expect(subject.take_off).to eq plane # takes off a plane, that landed before.
		end

		# raise an error to take off if there is 0 planes in the airport
		describe 'Exception of take_off' do
			it 'Error when take off plane on a empty airport' do
				expect { subject.take_off }.to raise_error "0 planes available to take off" 
			end
		end
		# raise an error if airport is full (Default capacity - see airport.rb)
		describe 'Exception of to_land' do
			it 'Error when plane landing on a full airport' do
				subject.capacity.times { subject.to_land(Plane.new) }
				expect { subject.to_land(Plane.new) }.to raise_error "No authorization to land. Airport is full!"
			end
		end
		
		# contexting a default capacity for Airport
		context 'Default capacity (2)' do
			it { expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY }
		end

		# ?? context 'Initialization' do??																									STEP 17
		# 	it 'Changing airport capacity' do 
		# 		airport = Airport.new(2)
		# 		2.times { airport.to_land Plane.new }
		# 		expect { aiport.to_land Plane.new }.to raise_error 'Docking station full'
		# 	end
		# end
		
		# storm
		it { is_expected.to respond_to :stormy? }
		# describe 'Exception if stormy' do
		# 	it 'Error if "random number" >= 8' do
				
end 