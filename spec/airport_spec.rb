require './lib/airport'

describe Airport do

    let(:airport) { Airport.new }
    
    it 'airport responds to land' do
      expect(airport).to respond_to(:land)
    end

    # it 'a plane can interact with take_off' do 
    #   #   arrange, act, assert
    # #   plane = Plane.new
    #   expect(plane).to respond_to(:take_off)
    # end

end

describe Plane do


    
    # it 'can take off' do
    # #   arrange, act, assert
    #   airport = Airport.new
    #   result = Plane.new.take_off
    #   puts result
    #   expect(result.length).to eq(0)
    # end

end

