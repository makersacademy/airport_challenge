require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  it 'knows it is flying' do
    expect(plane.flying?).to be(true).or be(false)
  end

  it 'knows it has landed' do
    expect(plane.landed?).to be(true).or be(false)
  end
end
