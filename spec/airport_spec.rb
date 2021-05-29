require 'airport'
require 'plane'
describe 'airport' do
    #user story 1
    it 'can instruct plane to land safely' do
        airport = Airport.new
        expect(airport).to respond_to(:land).with(1).arguments
    end
    #user story 2
    it 'can instruct a plane to take off safely' do
        airport = Airport.new
        expect(airport).to respond_to(:take_off).with(1).arguments
    end
    #user story 3
    describe '#land' do
        it 'raises an error if airport full' do  
          airport = Airport.new
          Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
          expect {airport.land(Plane.new)}.to raise_error('Airport full')
      end   
    end
    #user story 4
    it 'stops planes from landing when stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to recieve(:stormy?).and_return true
    expect {airport.land(plane)}.to raise_error('Stormy!')
    end
end
