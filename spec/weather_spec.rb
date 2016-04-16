require 'weather'
describe Weather do

  let(:weather) {described_class.new}

  it { is_expected.to respond_to :stormy? }

end