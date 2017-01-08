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

end
