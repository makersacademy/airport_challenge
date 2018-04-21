require 'weather'

describe Weather do
subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:check).with(1).argument }

end
