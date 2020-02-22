require 'airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
  end

  describe '#land' do
    it 'lets a plane land' do
      expect {@plane.land}.not_to raise_error
    end
  end

  describe '#take_off' do
    it 'lets a plane take off from the airport' do
      expect {@plane.take_off}.not_to raise_error
    end
  end

  describe '#empty' do
    it 'lets the controller check that a plane has left the airport' do
      @plane.take_off
      expect(@airport).to be_empty
    end
  end
end
