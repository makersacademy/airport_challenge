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
end
