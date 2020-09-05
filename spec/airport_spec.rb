require 'airport'
require 'plane'

describe Airport do 
it { is_expected.to respond_to :land_plane }

it { is_expected.to respond_to :take_off }

it "raises an error when a plane is trying to take off and its not at the airport" do 
    airport = Airport.new 
    plane = Plane.new 
    expect { airport.take_off }.to raise_error("There are no planes!") 
end 
    
    

end