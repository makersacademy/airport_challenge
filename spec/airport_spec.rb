require 'airport'

describe Airport do
  subject { described_class.new(:LAX) }
  it { is_expected.to respond_to(:stormy?) }
  it { is_expected.to respond_to(:code) }
end
