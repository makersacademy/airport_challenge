require 'airport.rb'

RSpec.describe Airport do 

  describe "#Land" do 
    it 'should land a plane' do  
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return(false)
      expect { airport.land(plane) }.not_to raise_error
    end 
  end 

  describe 'take off' do
    it 'plane takes off' do  
      airport = Airport.new(20)
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end 
  end

  context '#When full' do
    it 'does not allow planes to land if airport is full' do 
      airport = Airport.new(20)
      allow(airport).to receive(:stormy?).and_return(false)
      20.times do 
        airport.land(:plane)
      end 
      expect { airport.land(:plane) }.to raise_error 'cannot land plane airport full'
    end
  end 

  context '#Stormy'
  it 'does not allow plane to take off if weather is stormy' do 
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
  end 
end 
