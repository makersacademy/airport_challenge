require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#land' do
    it 'has a land method' do
      is_expected.to respond_to(:land).with(1).argument
    end
  end
end
