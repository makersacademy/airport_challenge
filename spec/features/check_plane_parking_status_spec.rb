require 'spec_helper.rb'
require 'plane'
require 'airport'
 
feature 'Checking parking status for a plane' do

  context 'When a plane has not landed' do
    scenario 'Air traffic controller can check the plane is not in the airport' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.parked?(plane)).to eq false
    end
  end
 
  context 'When a plane has landed' do 
    scenario 'Air traffic controller can check the plane has landed' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport = Airport.new
      airport.receive(plane)
      expect(airport.parked?(plane)).to eq true
    end
  end

  context 'When a plane has just taken off' do
    scenario 'Air traffic controller can check the plane is not in the airport' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport = Airport.new
      airport.receive(plane)
      airport.release(plane)
      expect(airport.parked?(plane)).to eq false
    end
  end
end
