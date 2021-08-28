require 'plane'
describe Plane do

  context 'I want to instruct a plane to land at an airport' do
    
    it 'expects a plane objct to exist' do
      expect(subject).to be_instance_of(Plane)
    end
  end
end