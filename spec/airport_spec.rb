require 'airport'
require 'plane'

RSpec.describe 'Airport' do
  context 'When describing an Airport' do
    
    Heathrow = Airport.new
    a380 = Plane.new
    
    it 'Should be an Airport object' do
      expect(Heathrow.class).to eq Airport
    end
    
    it "Should have a capacity method" do
      expect(Heathrow.capacity(5)).to eq 5
    end
  
    it "Should have a default capacity" do
      expect(Heathrow.capacity).to eq 5
    end

    it "Should be able to access to plane class, which is on another file" do
      expect(a380.class).to eq Plane
    end

    it "Should be able to track the number of planes there" do
      expect(a380.class).to eq Plane
    end
  end
end
