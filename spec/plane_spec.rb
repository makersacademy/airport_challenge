require 'plane'

RSpec.describe 'Plane' do
  context 'When describing a plane' do
    it 'Should be able to land' do
      a380 = Plane.new 
      expect(a380.land).to eq "I am landing"  
    end
    it 'Should be able to take off' do
      a380 = Plane.new
      expect(a380.takeoff).to eq "I am taking off"
    end
  end
end
