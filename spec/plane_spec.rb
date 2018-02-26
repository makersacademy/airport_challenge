require_relative '../lib/plane'

describe Plane do
  subject(:plane) { described_class.new }
  describe '#initialize' do
    it 'creates a plane with a default flying state' do
      expect(plane.grounded).to eq false
    end
  end
end
