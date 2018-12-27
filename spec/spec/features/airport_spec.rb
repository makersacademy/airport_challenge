require 'airport.rb'
RSpec.describe Airport do 

  describe "#Airport" do 
    it 'should land a plane' do  
      airport = Airport.new(20)
      plane = Plane.new
      expect { airport.land(plane) }.not_to raise_error
    end 
  end 
  it 'plane takes off' do  
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end 

  it 'does not allow planes to land if airport is full' do 
    airport = Airport.new(20)
    20.times do 
      airport.land(:plane)
    end 
    expect { airport.land(:plane) }.to raise_error 'cannot land plane airport full'
  end
end 
