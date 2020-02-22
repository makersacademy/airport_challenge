require 'airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
  end

  describe '#empty' do
    it 'lets the controller check that a plane has left the airport' do
      @plane.take_off
      expect(@airport).to be_empty
    end
  end
end
