require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed?'
  it 'checks that a plane has landed' do
    expect(subject).to respond_to :landed?
  end
end
