describe "Feature Test" do 
  it "works" do
    gatwick = Airport.new
    plane = Plane.new
		gatwick.allow_landing(plane)
		gatwick.allow_take_off
		city = Airport.new(1)
    city.allow_landing(plane)
    city.allow_take_off
    city.allow_landing(Plane.new)
  end
end