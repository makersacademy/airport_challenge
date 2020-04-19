require 'plane'
require 'airport'

describe Plane do

  describe 'land and takeoff' do
    before(:each) do
      @plane = Plane.new
      @airport = Airport.new
      @plane.land(@airport)
    end

    describe 'land' do
      it 'Can land in a airport' do
        expect(@plane.current_airport).to eq(@airport)
      end
    end

    it 'A plane can only land if its not currently assigned to an airport' do
      airport1 = Airport.new
      expect{ @plane.land(airport1) }.to raise_error("To land plane here please take off from current airport")
    end

    it 'A plane cannot land in a full airport' do
      expect{ 5.times { Plane.new.land(@airport) } }.to raise_error("This airport is full")
    end

    describe 'takeoff' do
      it 'Can takeoff from a airport' do
        @plane.takeoff
        expect(@plane.current_airport).to eq("")
      end
    end
  end
end
