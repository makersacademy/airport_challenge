require './lib/airport'

describe Airport do
    
    it 'contains a plane' do
    #   arrange, act, assert
      airport = Airport.new
      expect(airport).to respond_to(:plane)
    end

    it 'a plane can take off' do 
    #   arrange, act, assert
     plane = Plane.new
     expect(plane).to respond_to(:take_off)
    end

     
end
