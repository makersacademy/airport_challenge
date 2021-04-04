require 'airport'
require 'plane'

describe 'Airport' do
  subject(:airport) {Airport.new}
  
  describe 'conditions for #land(plane)' do
    it "allows airport to accept landing plane" do
      allow(airport).to receive(:land)
    end
  end
  
  describe 'conditions for #take_off(plane)' do
    it "allows airport to release plane in take off" do
      allow(airport).to receive(:take_off)
    end
  end
  

end