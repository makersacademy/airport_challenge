require 'plane'
require 'airport'

describe Plane do
  describe '#instruct_land' do
    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.instruct_land(@airport)
    end
    it 'lands plane' do
      expect(@plane::landed).to eq(true)
    end
  end

  describe '#already_landed' do
    before do
      @airport = Airport.new
      @plane = Plane.new
    end
    it 'returns error when plane already in airport is instructed to land' do
      (@plane.instruct_land(@airport))
      expect{@plane.instruct_land(@airport)}.to raise_error
    end
  end

  describe '#instruct_takeoff' do
    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.instruct_land(@airport)
    end
    it 'launches plane' do
      @plane.instruct_takeoff(@airport)
      expect(@plane::landed).to eq(false)
    end
  end

  describe '#already_airborne' do
    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.instruct_land(@airport)
    end
    it 'returns error when plane already airborne is instructed to take off' do
      @plane.instruct_takeoff(@airport)
      expect{@plane.instruct_takeoff(@airport)}.to raise_error
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
      @airport = Airport.new(10)
      @plane = Plane.new
    end
    context 'Airport full' do
      it 'prevents landing when airport is at capacity' do
      10.times { Plane.new.instruct_land(@airport) }
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
