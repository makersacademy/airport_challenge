require 'airport'

describe Airport do 
	before :each do 
		@airport = Airport.new
		@plane = Plane.new
		@plane = @airport.land
		
		#@plane = double(:plane)
		#allow(@plane).to recieve()
end 
	it 'confirms when a plane has landed' do 
		expect(@airport).to respond_to :land 
	 end 	
end 
