require 'weather'
require 'airport'
require 'plane'

describe Weather do

  describe '#stormy?' do
    it 'should respond to method stormy' do
      expect(subject).to respond_to(:stormy?)
    end
  end
end
