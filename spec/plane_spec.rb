require 'plane'

describe Plane do
  context 'Instruct a plane to land at an airport' do
    it 'expects a plane class to exist' do
      expect(subject).to be_instance_of(Plane)
    end
  end
end
