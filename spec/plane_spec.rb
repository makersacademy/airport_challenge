require 'plane'
require 'airport'

describe Plane do
  describe '#instruct_land' do
    it 'lands plane' do
      @airport = Airport.new
      @plane = Plane.new
      p "HERE", @plane
      @plane.instruct_land(@airport)
      p "HERE", @plane
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
      @airport3 = Airport.new
      @plane3 = Plane.new
      @plane3.instruct_land(@airport3)
    end
    context 'clear weather' do
      it 'allows takeoff' do
        allow(@plane3).to receive(:prevent_takeoff).and_return(false)
        expect(@airport3.planes.include?(@plane3)).to eq(false)
      end
    end
    context 'If weather is stormy' do
      it 'prevents takeoff' do
        allow(@plane3).to receive(:prevent_takeoff).and_return(true)
        expect(@airport3.planes.include?(@plane3)).to eq(true)
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
