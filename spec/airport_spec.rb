require 'airport'
require 'plane'

describe Airport do 
it { is_expected.to respond_to :land }

it { is_expected.to respond_to :take_off }

it "raises an error when a plane is trying to take off and its not at the airport" do 
    airport = Airport.new 
    plane = Plane.new 
    expect { airport.take_off(plane) }.to raise_error("There are no planes!") 
end 
    
 it "raises an error when a plane is trying to land at a full airport" do
    airport = Airport.new
    (Airport::CAPACITY).times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error("The airport is full")
 end 

end