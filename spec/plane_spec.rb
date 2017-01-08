require 'plane'

describe Plane do
  describe '#land' do
    it 'reports status of plane landing' do
      expect(subject.land).to eq true
    end
  end
end
