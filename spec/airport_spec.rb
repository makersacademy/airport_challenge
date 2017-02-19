require 'airport'

describe Airport do
	let(:airport){described_class.new}

	it {is_expected.to respond_to :capacity}
	it {is_expected.to respond_to :planes }
	context 'airport check' do
		it 'should check the capacity' do
			expect(airport.capacity).to eq 20		
		end
		it 'also check on variable capacity' do
			expect(airport.capacity = 25).to eq 25
		end
		it 'should raise error if airport full' do
			airport.capacity.times{airport.land(Plane.new)}
			expect{airport.land(Plane.new)}.to raise_error "Airport is full"
		end
		it 'should raise error if airport is empty' do
			expect{airport.takeoff}.to raise_error "Airport is empty"
		end
	end # => Context	

	describe 'plane landed' do
		# before(:each) {plane = Plane.new}
		it 'should confirm the weather' do

		end
		
		it 'should receive the plane safely' do	
			plane = Plane.new

			expect(airport.land(plane)).to eq [plane]
		end
		it 'should confirm plane is landed' do
			plane = Plane.new
			airport.land(plane)
			expect(plane.grounded).to eq true
		end
		it 'should prevent landing if weather is stormy' do
		end

	end 	# plane landed
	
	describe 'plane take off' do
		
		it 'should confirm the weather' do

		end
		it 'should update the status of plane' do
			plane = Plane.new
			airport.land(plane)
			airport.takeoff
			expect(plane.takeoff).to eq true			
		end
		it 'should confirm plane tookoff' do
			plane = Plane.new
			airport.land(plane)
			expect(airport.takeoff).to eq plane
		end
		it 'should prevent if weather is stormy' do

		end


	end
end