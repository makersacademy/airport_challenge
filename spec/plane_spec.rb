require 'plane'

describe Plane do

  before(:each) { @plane = Plane.new }

  it 'cannot be at an airport if airborne' do
    airport = Airport.new
    expect(airport.send(:planes)).not_to include(@plane)
  end

  it 'must be at an airport if not airborne' do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return :sunny
    airport.land(@plane)
    expect(airport.send(:planes)).to include(@plane)
  end

  describe 'these tests require a landed plane' do

    before(:each) { @plane.landed }

    describe '#landed' do
      it 'specifies that a plane is no longer airborne' do
        expect(@plane.airborne).to eq(false)
      end
    end

    describe '#taken_off' do
      it 'specifies that a plane is airborne' do
        @plane.taken_off
        expect(@plane.airborne).to eq(true)
      end
    end
  end
end
