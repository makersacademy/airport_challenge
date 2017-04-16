require 'airport'
require 'plane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :landed? }

end
