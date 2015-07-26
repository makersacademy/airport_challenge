require 'pilot'

describe Pilot do 

	context 'when created' do
		it 'has a newly created plane by default' do 
			expect(subject.plane).to be_a Plane
		end

		it 'does not have permission to land' do 
			expect(subject.permission_to_land).to be false
		end
	end

	context 'when in the air' do 
		it 'can request to land' do 
			expect(subject).to respond_to :request_to_land
		end

		it 'can land a plane' do
			airport = Airport.new
			airport.stub(:weather).and_return("Glorious sunshine")
      		plane = Plane.new(airport)
      		plane.pilot.request_to_land(airport)
      		plane.pilot.land_plane(airport)

      		expect(plane).to be_landed
    	end

    	it 'cannot land plane if he/she does not have permission to land' do 
    		airport = Airport.new 
    		plane = Plane.new(airport)
    		expect{plane.pilot.land_plane(airport)}.to raise_error "Get permission to land first!"
    	end

    	describe '#request_to_land' do 
    		it 'fails if request is directed to wrong airport' do 
    			airport = Airport.new
    			airport2 = Airport.new
    			plane = Plane.new(airport)
    			expect{plane.pilot.request_to_land(airport2)}.to raise_error "Permission to land denied"
    		end
    	end
	end

	context 'after landing' do 
		it 'permission to land is reset to false' do 
			airport = Airport.new
			airport.stub(:weather).and_return("Glorious sunshine")
      		plane = Plane.new(airport)
      		plane.pilot.request_to_land(airport)
      		plane.pilot.land_plane(airport)

      		expect(plane.pilot.permission_to_land).to be false			
		end
	end

	context 'after taking off' do 
		it 'permission to take off is reset to false' do
			airport = Airport.new
			airport.stub(:weather).and_return("Glorious sunshine")
			airport2 = Airport.new
      		plane = Plane.new(airport)
      		plane.pilot.request_to_land(airport)
      		plane.pilot.land_plane(airport)	

      		plane.pilot.request_to_take_off(airport2)
      		plane.pilot.take_off(airport2)

      		expect(plane.pilot.permission_to_take_off).to be false		
		end
	end
end