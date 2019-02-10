require './lib/plane.rb'

describe Plane do
  before(:each) do
    @airport_double = double(:airport, land_plane: "")
    @is_airborne = true
  end

  describe 'plane in sunny conditions' do
    before(:each) do
      @weather_double = double(:weather, is_stormy: false)
      @plane = Plane.new(@weather_double, @is_airborne)
    end

    it 'should instruct plane to land at the specified airport' do
      @plane.land(@airport_double)
  
      expect(@airport_double).to have_received(:land_plane).with(@plane)
    end

    it 'should raise exception if attempting to land plane whilst it is on the ground' do
      plane = Plane.new(@weather_double)

      expect { plane.land(@airport_double) }.to raise_error('Plane is already on the ground')
    end

    it 'should instruct plane to take off and get back confirmation that plane is airborne' do
      is_airborne = false
      plane = Plane.new(@weather_double, is_airborne)

      expect(plane.take_off).to eq(true)
    end

    it 'should raise exception if attempting to take off whilst it is airborne' do
      expect { @plane.take_off }.to raise_error('Plane is already airborne')
    end
  end

  describe 'plane in stormy conditions' do
    before(:each) do
      @weather_double = double(:weather, is_stormy: true)
      @plane = Plane.new(@weather_double, @is_airborne)
    end

    it 'should prevent takeoff when weather is stormy' do
      is_airborne = false
      plane = Plane.new(@weather_double, is_airborne)

      expect { plane.take_off }.to raise_error('Cannot take off due to stormy weather')
    end

    it 'should prevent landing when weather is stormy' do
      expect { @plane.land(@airport_double) }.to raise_error('Cannot land due to stormy weather')
    end
  end
end
