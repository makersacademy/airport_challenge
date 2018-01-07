require 'airport'
require 'weather'

describe Plane do

  subject(:plane) { Plane.new }

  context 'when plane has landed' do

    it 'is not airborne after landing' do
      plane.land
      expect(plane.airborne).not_to eq true
    end

  end

  context 'when plane is airborne' do

    it 'says it is airborne after take_off' do
      plane.land
      plane.takeoff
      expect(plane.airborne).to eq true
    end

  end

end
