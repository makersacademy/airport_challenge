require 'airport'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
end
