require 'airport'

describe Airport do	
	subject(:airport){described_class.new}
	let(:plane){Plane.new}

	it {is_expected.to respond_to(:land).with(1).argument}
	it {is_expected.to respond_to :capacity}
	it {is_expected.to respond_to :planes }

	context 'airport check' do
		it 'should check the capacity' do			
			expect(airport.capacity).to eq 20		
		end		
		it 'should raise error if airport full' do			
			airport.capacity.times{airport.land(plane)}
			expect{airport.land(plane)}.to raise_error "Airport is full"
		end
		it 'should raise error if airport is empty' do
			expect{airport.takeoff}.to raise_error "Airport is empty"
		end
	end # => Context	

	describe 'plane landed' do		
		it 'should receive the plane safely' do				
			expect(airport.land(plane)).to eq [plane]
		end
		it 'should confirm plane is landed' do			
			airport.land(plane)
			expect(plane.grounded).to eq true
		end
	end 	# plane landed
	
	describe 'plane take off' do		
		it 'should update the status of plane' do			
			airport.land(plane)
			airport.takeoff
			expect(plane.takeoff).to eq true			
		end
		it 'should confirm plane tookoff' do			
			airport.land(plane)
			expect(airport.takeoff).to eq plane
		end
	end		#Plane takeoff
end