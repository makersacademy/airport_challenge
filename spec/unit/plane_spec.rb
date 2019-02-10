require './lib/plane.rb'

describe Plane do
  before(:each) do
    @airport_double = double(:airport, land_plane: "", take_off_plane: "")
  end

  describe 'Given plane is airborne, ' do
    before(:each) do
      is_airborne = true
      @plane = Plane.new(is_airborne)
    end

    it 'should land at the specified airport' do
      @plane.land(@airport_double)
  
      expect(@airport_double).to have_received(:land_plane).with(@plane)
    end

    it 'should raise exception if attempting to take off (as already airborne)' do
      expect { @plane.take_off(@airport_double) }.to raise_error('Plane is already airborne')
    end
  end

  describe 'Given plane is on the ground, ' do
    before(:each) do
      is_airborne = false
      @plane = Plane.new(is_airborne)
    end

    it 'should, when instructed to take off, instruct airport to remove it from the airport' do
      @plane.take_off(@airport_double)

      expect(@airport_double).to have_received(:take_off_plane).with(@plane)
    end

    it 'should, on take off, return confirmation that plane is airborne' do
      expect(@plane.take_off(@airport_double)).to eq(true)
    end

    it 'should raise exception if attempting to land plane (as it is on the ground)' do
      expect { @plane.land(@airport_double) }.to raise_error('Plane is already on the ground')
    end
  end
end
