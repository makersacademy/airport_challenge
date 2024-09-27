require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  let(:airport) { Airport.new }
  it 'responds to flying? method' do
    expect(plane).to respond_to(:flying?)
  end
end
