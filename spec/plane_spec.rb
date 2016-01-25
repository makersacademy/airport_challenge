require 'plane'
require 'airport'

  describe Plane do
	it {is_expected.to respond_to(:airborne?)}
	it 'returns true when airborne' do
      expect(subject.airborne?).to eq(true)
	end
  end