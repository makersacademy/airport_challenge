require "airport"
#require "plane"

describe Airport do #.new(1) do
 it "is expected to respond to airport" do
 airport = Airport.new(1)
 expect(airport).to respond_to(:airport)
 end
end

describe Airport do #.new(1) do

    it "should be able to land a plane" do
    airport = Airport.new(1)
    plane = Plane.new #makes a new plane
    #airport.land(plane) #laning the neewly made plane which stores it into an array

    expect(airport.land(plane)).to eq([plane])


  end

    it "can take off" do
    airport = Airport.new(1)
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off).to eq (plane)
   end
    describe "take_off" do
      #this test is not making a new instance of a plane and is
      #not landing anything so there should be nothing at the airport
      airport = Airport.new(1)
      it 'shows when there are no more planes in the airport' do
      expect{airport.take_off}.to raise_error('there are no more planes in the airport')
    end
  end
  describe Airport do
    describe 'initialize' do
      it 'has a variable capacity and shows full if that capacity is exceded' do
      airport = Airport.new(50)
      50.times { airport.land Plane.new }
      expect{ airport.land Plane.new }.to raise_error 'Airport is full'
    end
  end
end
end
