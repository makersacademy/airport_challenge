require 'airport.rb'
RSpec.describe Airport do 

  describe "#Airport" do 
    it 'should land a plane' do  
      airport = Airport.new
      plane = Plane.new
      expect {airport.land(plane)}.not_to raise_error
    end 
  end 
  it 'should land a plane' do  
    airport = Airport.new
    plane = Plane.new
    expect {airport.take_off(plane)}.not_to raise_error
  end 

end 