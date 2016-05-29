require 'spec_helper.rb'
require 'plane'
require 'airport'

feature 'Instructing a plane to land into an airport' do

  context 'When weather conditions are good' do

    context 'and airport has free space' do
      scenario 'Air traffic controller can land a plane without error' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        airport = Airport.new
        expect{airport.receive(plane)}.not_to raise_error
      end
    end

    context 'and airport is full' do
      scenario 'Air traffic controller cannot land a plane(error is raised)' do
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        airport = Airport.new
        Airport::DEFAULT_CAPACITY.times{airport.receive(Plane.new)}
        expect{airport.receive(plane)}.to raise_error
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
    end 

    context 'and airport is full' do
      scenario 'Air traffic controller cannot land a plane (error is raised)' do
        #weather is good fist to allow the airport to fill up
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        airport = Airport.new
        (Airport::DEFAULT_CAPACITY).times{airport.receive(Plane.new)}
        #back to bad weather, we are in England after all :P 
        allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        expect{airport.receive(plane)}.to raise_error
      end
    end
  end 
end
