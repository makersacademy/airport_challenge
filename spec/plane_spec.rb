require 'plane'

describe Plane do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should exist in an airport after landing' do
      @plane.land(@airport)
      expect(@airport.planes).to include(@plane)
    end
  end

end
