require 'Plane'

describe Plane do
  describe '#working?' do
    it 'returns true when calling the working method' do
       expect(subject.working?).to eq true
    end
  end
end
