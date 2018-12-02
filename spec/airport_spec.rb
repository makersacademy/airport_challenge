require "airport"
describe Airport do 

  it "responds to plane landing" do
  expect(subject).to respond_to :land_plane  
  end 

	it "allows us to land plane at airport" do
	plane = Plane.new
	expect(subject.land_plane(plane)).equal? plane
	end 	 
end 