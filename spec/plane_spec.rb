require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'returns landed' do
    expect(plane.landed).to be false
  end

end
