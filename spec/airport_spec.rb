require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}

    it 'is expected to respond to the method "land" with 1 argument' do
        expect(airport).to respond_to(:land).with(1).argument
    end
    it 'is expected to respond to the method "take_off" with 1 argument' do
        expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'is expected to respond to the method "take_off" and return a success message' do
        plane = Plane.new
        expect {airport.take_off(plane)}.to output("Successful take-off\n").to_stdout
    end
end