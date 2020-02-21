require 'airport'

describe Airport do 

	
end

describe "#plane_land" do 
it "raises an error when the weather is stormy" do
	expect { subject.plane_land }.to raise_error " Due to bad weather, plane can not land!"
end
end