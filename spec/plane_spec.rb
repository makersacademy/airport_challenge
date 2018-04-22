require 'plane'

describe Plane, :plane do
  describe '#flying?' do
    it 'is flying when initialised' do
      expect(subject).to be_flying
    end
  end
end
