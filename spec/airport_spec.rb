require './lib/airport'

describe Airport do
    
    it 'contains a plane' do
    #   arrange, act, assert
      airport = Airport.new
      expect(airport).to respond_to(:plane)
    end

end

describe Plane do

    it 'a plane can interact with take_off' do 
    #   arrange, act, assert
      plane = Plane.new
      expect(plane).to respond_to(:take_off)
    end
    
    it 'can take off' do
    #   arrange, act, assert
      plane_store = [1]
      plane = Plane.new
    #   airport = Airport.new
      expect(plane.take_off).to be_an_instance_of(:airport)
    end

end

