require './lib/airport.rb'

describe Airport do 
  before(:each) do 
    @airport = Airport.new
    
  end 

  it "responds to land method" do
    expect(@airport).to respond_to(:land)
  end
  
  it "Land method can recieved a plane" do
    plane = Plane.new
    expect(@airport.land(plane)).to eq([plane]) 
  end

  it "Makes plane take off, removing instance from @plane, then it checks array is now n-1" do 
    @plane = []
    @plane << Plane.new
    expect(@airport.take_off(@plane)).to eq([])
  end 

  it "Stores 5 plane instances and removes the third instance" do 
    arr = []
    5.times {plane = Plane.new; arr << plane} 
    third_instance = arr[2]
    before = arr 
    arr.delete(third_instance)
    expect(Airport.new(before).take_off(third_instance)).to eq(arr) 
  end

  it "Raises error if land method is called while airport is at capacity" do 
    arr = []; 5.times {arr << Plane.new}
    heathrow = Airport.new(arr)
    expect {heathrow.land Plane.new}.to raise_error "Airport at capacity"
  end 
end