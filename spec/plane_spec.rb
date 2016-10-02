require 'plane.rb'

describe Plane do
  subject(:plane) { described_class.new }
  it { is_expected.to respond_to(:landed?).with(false) }
  it 'can take off when landed' do
   plane.landed?
   expect(plane.taken_off?).to eq true
 end
end
