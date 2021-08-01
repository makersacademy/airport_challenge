require './lib/airport.rb'

describe Airport do 
  before(:each) do 
    @airport = Airport.new
  end 
  
  describe '#land' do

    it "responds to land method" do
      expect(@airport).to respond_to(:land)
    end
    
    it "Land method can recieved a plane" do
      plane = Plane.new
      heathrow = Airport.new([], 2, 5)
      expect(heathrow.land(plane)).to eq([plane]) 
    end

    it "Allows user to set capacity for particular airport instance" do 
      capacity = rand(1..50)
      arr = []; capacity.times { arr << Plane.new }
      heathrow = Airport.new(arr, capacity, 5)
      expect { heathrow.land Plane.new }.to raise_error "Airport at capacity"
    end
  end  

  describe '#take_off' do

    it "Makes plane take off, removing instance from plane, then it checks array is now empty" do 
      plane = Plane.new
      heathrow = Airport.new([plane], 3, 5)
      expect(heathrow.take_off(plane)).to eq([])
    end 
  
   # this test is now failing 
    it "Stores 5 plane instances and removes the third instance in array" do 
    # below line creates 5 instances of plane class storing them inside planes array
    # we can no lable 3rd instance and pass planes array to Aiport instance
      planes = []; 5.times { plane = Plane.new; planes << plane } 
      third_instance = planes[2]
      heathrow = Airport.new(planes, 3, 5)
      expect(heathrow.take_off(third_instance)).to eq((planes.delete(third_instance); planes))
    end

    it "Stops plane from taking off if instance doesn't exist inside Airport instance" do 
      plane1 = [Plane.new]
      plane2 = [Plane.new]  
      heathrow = Airport.new([plane1], 4, 5)
      expect { heathrow.take_off(plane2) }.to raise_error "This plane is not at this airport"
    end

    it "Stops take_off executing is weather is stormy(random number falls between 7..10), otherwise its clear" do 
      # weather is story whenever it recieves an int greater than 7
      boeing23 = Plane.new 
      heathrow = Airport.new(boeing23, 2, 8)
      expect { heathrow.take_off(boeing23) }.to raise_error "Weather is stormy"
    end

  end
end
