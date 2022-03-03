require 'plane'
require 'airport'
require 'weather'

describe Plane do
  subject(:plane) { described_class.new }

  it 'responds to landed method' do
    expect(plane).to respond_to(:landed?)
  end

end