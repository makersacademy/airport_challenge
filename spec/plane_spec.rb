require 'plane'

describe Plane do

  describe '#new' do
    it 'initializes a new plane that is not airborne' do
      expect(subject::airborne).to eq false
    end
  end

end
