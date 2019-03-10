require './lib/airport.rb'
require './lib/plane.rb'

RSpec.describe 'Airport' do
  context 'When describing an Airport in good weather' do
    
    Heathrow = Airport.new
    a380 = Plane.new
    a111 = Plane.new
    a222 = Plane.new
    a333 = Plane.new
    
    it 'Should be an Airport object' do
      expect(Heathrow.class).to eq Airport
    end
    
    it "Should have a capacity method" do
      expect(Airport.new(9).capacity).to eq 9
    end
  
    it "Should have a default capacity" do
      expect(Airport.new.capacity).to eq 3
    end

    it "Should be able to access to plane class, which is on another file" do
      expect(a380.class).to eq Plane
    end

    it "Should be able to track the number of planes there" do
      expect(Heathrow.runway).to eq []
    end

    it "Should add a plane to the runway when landing at airport" do
      Heathrow.land_plane(a380)
      expect(Heathrow.runway).to eq [a380]
    end

    it "Should remove a plane from the runway when taking off from airport" do
      Heathrow.takeoff_plane(a380)
      expect(Heathrow.runway).to eq []
    end

    it "Should prevent a plane from landing if the runway is full" do
      Heathrow.land_plane(a111)
      Heathrow.land_plane(a222)
      Heathrow.land_plane(a333)
      expect(Heathrow.at_capacity).to eq true  
    end

    it "Should prevent a plane from landing if the runway is full" do
      expect(Heathrow.land_plane(a380)).to raise "Airport at capacity, cant land any more planes here!"
    end
  end
end
