require 'airport'

describe Airport do
  it { is_expected.to respond_to(:empty?) }
  it { is_expected.to be_empty }
end