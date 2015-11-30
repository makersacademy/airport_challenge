require 'planes'

describe Plane do
	subject(:plane) { described_class.new }



	it {is_expected.to respond_to(:landed, :flying)}

	it "informs when a plane has landed" do 
	
		plane.landed
		expect(plane.landed).to eq true
	end

	


	

end