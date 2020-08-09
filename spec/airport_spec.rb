require './docs/airport'
require './docs/plane'

describe Airport do 
    subject(:airport) { described_class.new }
 # creates an Airport instance 
 it 'makes an instance of the Airport' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
    end 


it 'instruct a plane to land at the airport' do
    # I want to instruct a plane to land at an airport
    # airport = Airport.new- replaced with 'subject'
    expect(airport).to respond_to(:land).with(1).argument
    end


it 'instruct a plane to take off from the airport' do
# I want to instruct a plane to take off from an airport 
    expect(airport).to respond_to(:take_off).with(1).argument
    end

    
#   it 'does not allow a plane to land when airport is full' do
#    I want to prevent landing when the airport is full 
#     airport = Airport.new
#     plane = Plane.new
#     20.times do
#     airport.land(plane)
#     end

#     expect{ airport.land(plane) }.to raise_error 'Unable to land, airport capacity full'
#     #  airport = Airport.new(20)
#     # airport.capacity.times { airport.land(plane) }
#     # expect { airport.land(plane) }.to raise_error('Unable to land, airport capacity full')
#     end


# it "prevents plane landing when airport full" do
#     expect { airport.land(plane) }.to raise_error "Cannot land plane: airport is full"
#   end
end 
