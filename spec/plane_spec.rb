require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { described_class.new }
  subject(:plane1) { described_class.new }
  subject(:plane2) { described_class.new }

it 'tests for a Plane class' do
  expect(plane.class).to eq(Plane)
end

it { is_expected.to respond_to(:flying) }

it 'expects default plane status to be flying' do
  expect(plane.flying).to eq(true)
end

end
