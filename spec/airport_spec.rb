require 'airport'


describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to be_a(Airport) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

end
