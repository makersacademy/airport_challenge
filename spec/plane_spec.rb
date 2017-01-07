require 'plane'

describe Plane do
  
    it 'checks if plane is working' do
      expect(subject).to respond_to(:working?)
  end
end
