require 'plane'

  describe Plane do
  subject(:plane) { described_class.new }

  it 'changes status of plane to landed' do
    plane.landed?
    expect(plane.landed).to eq true
  end

end
