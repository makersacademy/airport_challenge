require 'plane'

describe Plane do
  plane = Plane.new

  describe '#landing' do
      it 'landing a plane in the airport' do
      should respond_to(:landing)
    end
      it 'checking if plane is grounded' do
      expect(subject.landing(false)).to eq true
    end
  end
end
