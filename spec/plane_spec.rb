require 'airport'
require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  context 'can do simple landings (Story 01):' do

    it 'lands when instructed to do so' do
      expect(plane).to receive(:land)
      plane.land
    end
    # Maybe the landing test should only exist here, and not in airport_spec.rb. Or viceversa.

    it 'knows that it has landed' do
      plane.land
      expect(subject.status).to eq 'landed'
    end

  end

  context 'can do simple takeoffs (Story 02):' do

    it 'takes off when instructed to do so' do
      expect(plane).to receive(:takeoff)
      plane.takeoff
    end

    it 'believes it can fly... err, knows that it is flying' do
      plane.takeoff
      expect(subject.status).to eq 'inflight'
    end

  end

end
