require './docs/airport'
require './docs/plane'

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 



describe Airport do 
 # creates an Airport instance 
 it 'makes an instance of the Airport' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
    end 


it 'instruct a plane to land at the airport' do
    # I want to instruct a plane to land at an airport
    airport = Airport.new
    expect(airport).to respond_to(:land)
    end

it 'instruct a plane to take off from the airport' do
# I want to instruct a plane to take off from an airport 
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
    end

    
# it 'raises an exception when airport is full' do
# # I want to prevent landing when the airport is full 
#     airport = Airport.new
#     airport.capacity.times { airport.land(plane) }
#     expect { airport.land(plane) }.to raise_error('Unable to land, airport capacity full')
#     end
end 
