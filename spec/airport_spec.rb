require 'airport'

describe Airport do 
	before :each do 
		@airport = Airport.new
		@plane = Plane.new
		@plane = @airport.land(@plane)
		@plane = @airport.take_off
		
		#@plane = double(:plane)
		#allow(@plane).to recieve()
end 
	it 'confirms when a plane has landed' do 
		expect(@airport).to respond_to :land 
	 end 	

	 it 'add a new instance variable for plane' do
	 		expect(@airport.land(@plane)).to eq(@plane)
	 end 

	 it { is_expected.to respond_to :take_off}
end 
