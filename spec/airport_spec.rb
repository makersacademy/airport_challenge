require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to :land }
end