require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'tracks if a plane has grounded' do
      expect(plane.in_flight).to eq true
    end
  end

end
