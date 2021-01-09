require 'airport_challenge'
describe Airport do 

    it 'responds to plane landing' do 
        airport = Airport.new
    expect(airport).to respond_to(:land_plane)
    end 
end 
