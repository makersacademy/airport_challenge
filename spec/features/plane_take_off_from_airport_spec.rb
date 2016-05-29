require 'spec_helper.rb'
require 'plane'
require 'airport'

feature 'Instructing plane to take off from airport' do

  context 'When weather conditions are good' do
    context 'and plane is in airport' do
      scenario 'Air traffic controller can instruct take off' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        airport = Airport.new
        airport.receive(plane)
        expect{airport.release(plane)}.not_to raise_error
      end
    end
  end 

  context 'When weather conditions are bad' do
    context 'and plane is in airport' do
      scenario 'Air traffic controller cannot instruct take off (error is raised)' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        airport = Airport.new
        airport.receive(plane)
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        expect{airport.release(plane)}.to raise_error
      end
    end 
  end 

end
