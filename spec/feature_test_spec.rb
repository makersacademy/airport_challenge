describe "Feature Test" do 
  it "works" do
    gatwick = Airport.new
    allow(gatwick).to receive(:stormy?).and_return(false)
    plane = Plane.new
		gatwick.allow_landing(plane)
		gatwick.allow_take_off
		
  end
end