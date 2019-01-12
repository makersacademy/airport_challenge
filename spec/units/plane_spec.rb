require 'plane'
require 'rspec'

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
      expect { @plane.land }.to raise_error('Unable to land: plane is already on the ground')
    end
  end

end
