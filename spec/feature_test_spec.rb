describe "Feature Test" do 
  it "works" do
    gatwick = Airport.new
    plane = Plane.new

    gatwick.allow_landing(plane)
    
    gatwick.allow_take_off


  end
end