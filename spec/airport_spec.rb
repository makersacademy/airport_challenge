require 'airport'

RSpec.describe Airport do
  context 'when a default airport is initialised' do
    it { is_expected.to respond_to :land }
  end
end
