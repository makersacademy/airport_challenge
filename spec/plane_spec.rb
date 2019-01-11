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

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should not exist in the airport planes after take off' do
      @plane.land(@airport)
      @plane.take_off(@airport)
      expect(@airport.planes).not_to include(@plane)
    end

    it 'should raise error when trying to take off from an airport it is not in' do
      expect { @plane.take_off(@airport) }.to raise_error('This plane is not at this airport')
    end
  end

end
