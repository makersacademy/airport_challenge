require 'airport'

describe Airport do
  context 'it responds to land' do
    it { is_expected.to respond_to :land }
  end
end
