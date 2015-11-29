require 'planes'

describe Plane do
	it {is_expected.to respond_to(:landed, :landed?, :flying)}

	it "informs when a plane has landed" do 
		plane = Plane.new
		plane.landed
		expect(plane.landed?).to eq true
	end

	


	

end