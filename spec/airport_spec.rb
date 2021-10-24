require 'airport'
require 'plane'

describe Airport do 
    airport = Airport.new(20)
    it "instructs a plane to land" do 
        allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:land).with(1).argument
    end 
  
    it "instructs a plane to take off" do
        allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:take_off).with(1).argument
    end 
    it "does not allow planes to take off when stormy" do 
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(:plane) }.to raise_error "Cant take off its stormy"
    end 

    it "does not allow landing when at capacity" do
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return false
         20.times do
            airport.land(:plane)
         end 
         expect { airport.land(:plane) }.to raise_error "cannot land plane: airport full"

    end 
       it "raises an error when asked to land plane when stormy" do 
        allow(airport).to receive(:stormy?).and_return true
        expect {airport.land(:plane)}.to raise_error "cannot land its stormy"
end 
end 