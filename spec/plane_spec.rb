require 'plane'

class AirportDouble
end

describe Plane do

  let(:airport) { AirportDouble.new }

  describe '#land(airport)' do
    it 'returns true if the plane is in the air' do
      expect(subject.land(airport)).to eq true
    end
  end

end