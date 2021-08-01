require './lib/airport.rb'

describe Airport do 
  before(:each) do 
    @airport = Airport.new
  end 
  
  describe '#take_off' do

    it "responds to land method" do
      expect(@airport).to respond_to(:land)
    end
    
    it "Land method can recieved a plane" do
      plane = Plane.new
      expect(@airport.land(plane)).to eq([plane]) 
    end

    it "Allows user to set capacity for particular airport instance" do 
      capacity = rand(1..50)
      arr = []; capacity.times {arr << Plane.new}
      heathrow = Airport.new(arr, capacity)
      expect {heathrow.land Plane.new}.to raise_error "Airport at capacity"
    end
  end  

  describe '#take_off' do

    it "Makes plane take off, removing instance from @plane, then it checks array is now empty" do 
      @plane = []
      @plane << Plane.new
      expect(@airport.take_off(@plane, 7)).to eq([])
    end 
  
    it "Stores 5 plane instances and removes the third instance in array" do 
      arr = []
      5.times {plane = Plane.new; arr << plane} 
      third_instance = arr[2]
      before = arr 
      arr.delete(third_instance)
      expect(Airport.new(before).take_off(third_instance, 7)).to eq(arr) 
    end

    it "Stops take_off executing is weather is stormy(random number falls between 7..10), otherwise its clear" do 
      arr = []; 3.times {arr << Plane.new}
      boeing23 = arr[1]
      heathrow = Airport.new(arr, 4)
      weather = 8
      expect {heathrow.take_off(boeing23, weather)}.to raise_error "Weather is stormy"
    end

    it "Stops plane from taking off if instance doesn't exist inside Airport instance" do 

    end
    
  end
end