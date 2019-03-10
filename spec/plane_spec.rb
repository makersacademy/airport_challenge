require 'plane'

RSpec.describe 'Plane' do

  a380 = Plane.new 

  context 'When describing a plane' do

    it 'should have an inflight status so it cant takeoff while flying' do
      expect(a380.in_flight).to eq true
    end

    it 'should have an on_tarmac status so it cant land while on the ground' do
      expect(a380.on_tarmac).to eq false
    end
  end
end
