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
    expect(@airport.take_off(@plane, "clear")).to eq([])
  end 

  it "Stores 5 plane instances and removes the third instance in array" do 
    arr = []
    5.times {plane = Plane.new; arr << plane} 
    third_instance = arr[2]
    before = arr 
    arr.delete(third_instance)
    expect(Airport.new(before).take_off(third_instance, "clear")).to eq(arr) 
  end

  it "Allows user to set capacity for particular airport instance" do 
    capacity = rand(1..50)
    arr = []; capacity.times {arr << Plane.new}
    heathrow = Airport.new(arr, capacity)
    expect {heathrow.land Plane.new}.to raise_error "Airport at capacity"
  end  

  it "Stops take_off executing is weather is stormy, default is clear" do 
    arr = []; 3.times {arr << Plane.new}
    boeing23 = arr[1]
    heathrow = Airport.new(arr, 4)
    weather = "stormy"
    expect {heathrow.take_off(boeing23, weather)}.to raise_error "Weather is stormy"
  end
end