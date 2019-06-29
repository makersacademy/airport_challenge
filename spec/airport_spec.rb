require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#land' do
    it 'allows plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
