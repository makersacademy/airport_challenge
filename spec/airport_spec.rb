require './lib/airport.rb'
require './lib/plane.rb'

RSpec.describe 'Airport' do
  context 'When describing an Airport' do
    
    Heathrow = Airport.new
    a380 = Plane.new
    
    it 'Should be an Airport object' do
      expect(Heathrow.class).to eq Airport
    end
    
    it "Should have a capacity method" do
      expect(Airport.new(9).capacity).to eq 9
    end
  
    it "Should have a default capacity" do
      expect(Airport.new.capacity).to eq 5
    end

    it "Should be able to access to plane class, which is on another file" do
      expect(a380.class).to eq Plane
    end

    it "Should be able to track the number of planes there" do
      expect(Heathrow.runway).to eq []
    end
  end
end
