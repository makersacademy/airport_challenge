require 'airport'

describe Airport do
  describe 'responds to instruction "land"' do
    it { is_expected.to respond_to(:land) }
  end

  describe '#land' do
    it 'takes a plane as an argument' do
      is_expected.to respond_to(:land).with(1).argument
    end
  end

end
