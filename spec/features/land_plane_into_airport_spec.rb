require 'spec_helper.rb'
require 'plane'
require 'airport'

feature 'Landing a plane into an airport' do

  context 'When weather conditions are good' do
    context 'and airport has free space' do
      scenario 'Air traffic controller can land a plane without error' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        airport = Airport.new
        expect{airport.receive(plane)}.not_to raise_error
      end
      
      scenario 'Air traffic controller can check the plane has landed' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        airport = Airport.new
        airport.receive(plane)
        expect(airport.parked?(plane)).to eq true
      end
    end
  end 

  context 'When weather conditions are bad' do
    context 'and airport has free space' do
      scenario 'Air traffic controller cannot land a plane (error is raised)' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        plane = Plane.new
        airport = Airport.new
        expect{airport.receive(plane)}.to raise_error
      end

      scenario 'Air traffic controller can check the plane was not landed' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        plane = Plane.new
        airport = Airport.new
        expect(airport.parked?(plane)).to eq false
      end
    end 
  end 
end
