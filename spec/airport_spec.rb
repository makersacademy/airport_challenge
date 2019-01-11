require 'airport'

describe Airport do
  describe '#weather' do
    it { is_expected.to respond_to(:weather)}
  end
end
