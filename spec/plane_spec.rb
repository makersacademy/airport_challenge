require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed?'
  it 'checks that a plane has landed' do
    expect(subject).to respond_to :landed?
  end

  describe '#take_off'
    it 'checks that a plane has taken off' do
      expect(subject).to respond_to :take_off?
    end
end
