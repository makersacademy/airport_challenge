require 'plane'

describe Plane do

  before(:each) do
    @plane = Plane.new
  end

  describe 'plane creation' do

    it 'should be flying initially' do
      expect(@plane.landed?).to be false
    end

  end

  describe 'plane behaviour' do

    it 'should not be able to land if already landed' do
      allow(@plane).to receive(:landed?).and_return(true)
      expect { @plane.land }.to raise_error(Plane::LANDED_ERROR)
    end

    it 'should return landed if landed' do
      @plane.land
      expect(@plane.landed?).to be(true)
    end

    it 'should not be able to takeoff if already in the air' do
      allow(@plane).to receive(:landed?).and_return(false)
      expect { @plane.takeoff }.to raise_error(Plane::ALREADY_FLYING_ERROR)
    end

    it 'should not return landed after taking off' do
      @plane.land
      @plane.takeoff
      expect(@plane.landed?).to_not be(true)
    end
  end

end
