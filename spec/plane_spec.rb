require 'plane.rb'

describe Plane do
  subject(:plane) { described_class.new }
  it { is_expected.to respond_to(:change_status) }
  it "changes flight status when landed" do
  expect(plane.change_status('landed')).to eq 'landed'
  end

end
