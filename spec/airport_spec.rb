require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to(respond_to(:land).with(1).argument) }

end
