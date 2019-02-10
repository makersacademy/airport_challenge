require './lib/plane.rb'

describe Plane do
  before(:each) do
    @airport_double = double(:airport, land_plane: "")
  end

  describe 'plane in sunny conditions' do
    before(:each) do
      @weather_double = double(:weather, get: "sunny")
      @plane = Plane.new(@weather_double)
    end

    it 'should instruct plane to land at the specified airport' do
      @plane.land(@airport_double)
  
      expect(@airport_double).to have_received(:land_plane).with(@plane)
    end

    it 'should instruct plane to take off and get back confirmation that plane is airborne' do
      expect(@plane.take_off).to eq(true)
    end
  end

  describe 'plane in stormy conditions' do
    before(:each) do
      @weather_double = double(:weather, get: "stormy")
      @plane = Plane.new(@weather_double)
    end

    it 'should prevent takeoff when weather is stormy' do
      expect(@plane.take_off).to eq(false)
    end

    it 'should prevent landing when weather is stormy' do
      expect { @plane.land(@airport_double) }.to raise_error('Cannot land due to stormy weather')
    end
  end
end
