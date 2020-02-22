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

  context 'plane landing when the airport is full' do
    it 'lets the contoller stop planes from landing' do
      plane2 = Plane.new
      expect { plane2.land }.to raise_error("The airport is full")
    end
  end
end
