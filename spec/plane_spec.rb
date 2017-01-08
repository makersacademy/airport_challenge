require 'plane'
require 'airport'

describe Plane do
  describe '#instruct_land' do
    it 'lands plane' do
      @airport = Airport.new
      @plane = Plane.new
      @plane.instruct_land(@airport)
      expect(@plane::landed).to eq(true)
    end
  end

  describe '#instruct_takeoff' do
    it 'launches plane' do
      airport = Airport.new
      plane = Plane.new
      plane.instruct_takeoff(airport)
      expect(plane::landed).to eq(false)
    end
  end

  describe '#prevent_takeoff' do
    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.instruct_land(@airport)
    end
    context 'clear weather' do
      it 'allows takeoff in clear weather' do
        allow(@plane).to receive(:prevent_takeoff).and_return(false)
        @plane.instruct_takeoff(@airport)
        expect(@airport.planes.include?(@plane)).to eq(false)
      end
    end
    context 'If weather is stormy' do
      it 'prevents takeoff in stormy weather' do
        allow(@plane).to receive(:prevent_takeoff).and_return(true)
        expect(@airport.planes.include?(@plane)).to eq(true)
      end
    end
  end

  describe '#prevent_landing' do
    before do
      @airport = Airport.new
      @plane = Plane.new
    end
    context 'clear weather' do
      it 'allows landing in clear weather' do
        allow(@plane).to receive(:prevent_landing).and_return(false)
        @plane.instruct_land(@airport)
        expect(@airport.planes.include?(@plane)).to eq(true)
      end
    end
    context 'If weather is stormy' do
      it 'prevents landing in stormy weather' do
        allow(@plane).to receive(:prevent_landing).and_return(true)
        expect(@airport.planes.include?(@plane)).to eq(false)
      end
    end
  end

  describe '#airport_full' do
    before do
      @airport = Airport.new(5)
      @plane = Plane.new
    end
    context 'Airport full' do
      it 'prevents landing when airport is at capacity' do
        p "HERE", @airport
      5.times { Plane.new.instruct_land(@airport) }
      expect{@plane.instruct_land(@airport)}.to raise_error
      end
    end
    context 'Airport not full' do
      it 'permits landing when airport is below capacity' do
      allow(@plane).to receive(:airport_full).and_return(false)
      @plane.instruct_land(@airport)
      expect(@airport.planes.include?(@plane)).to eq(true)
      end
    end
  end
end
=begin
First user story and domain model:
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
and confirm that it has landed

plane  | instruct to land
plane  | status: landed

plane  | instruct to take off
plane  | status: not in airport

=end
