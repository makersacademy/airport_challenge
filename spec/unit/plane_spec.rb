require './lib/plane.rb'

describe Plane do
  before(:each) do
    @airport_double = double(:airport, land_plane: "", take_off: "")
  end

  describe 'Given plane is airborne, ' do
    before(:each) do
      is_airborne = true
      @plane = Plane.new(is_airborne)
    end

    it 'should, when instructed to land, update airborne status to false' do
      @plane.land
  
      expect(@plane.is_airborne).to eq(false)
    end

    it 'should raise exception if attempting to take off (as already airborne)' do
      expect { @plane.take_off }.to raise_error('Plane is already airborne')
    end
  end

  describe 'Given plane is on the ground, ' do
    before(:each) do
      is_airborne = false
      @plane = Plane.new(is_airborne)
    end

    it 'should, on take off, update airborne status to true' do
      @plane.take_off
      expect(@plane.is_airborne).to eq(true)
    end

    it 'should, on take off, return confirmation that plane is airborne' do
      expect(@plane.take_off).to eq(true)
    end

    it 'should raise exception if attempting to land plane (as it is on the ground)' do
      expect { @plane.land }.to raise_error('Plane is already on the ground')
    end
  end
end
