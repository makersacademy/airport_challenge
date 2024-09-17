require 'airport'
require 'plane'

describe Airport do
    describe '#land' do
        it "lands a plane at an airport" do
            airport = Airport.new(30)
            plane = Plane.new
            allow(airport).to receive(:stormy?).and_return false
            expect(airport) .to respond_to :land
        end 

        it "does not let plane land when capacity is full" do
            airport = Airport.new(30)
            plane = Plane.new
            allow(airport).to receive(:stormy?).and_return false
            30.times do 
            airport.land(plane)
            end 
            expect{airport.land(plane)}.to raise_error 'Capacity is full : Cannot land plane'
        end
    end
 
    describe'#take_off' do
        it "instructs a plane to take off" do
            airport = Airport.new(30)
            plane = Plane.new
            expect(airport).to respond_to :take_off
        end
    end

    describe '#weather' do
        it "does not allow planes to land when stormy" do
            airport = Airport.new(30)
            plane = Plane.new
            allow(airport).to receive(:stormy?).and_return true
            expect{airport.land(plane)}.to raise_error 'Weather is stormy : Cannot land plane'
        end

        it "does not allow planes to take off when stormy" do 
            airport = Airport.new(30)
            plane = Plane.new
            allow(airport).to receive(:stormy?).and_return true
            expect{airport.take_off(plane)}.to raise_error 'Weather is stormy : Plane cannot take off'
        end
    end


end 