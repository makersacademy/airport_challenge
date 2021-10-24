require 'airport'

describe Airport do
    
  it { is_expected.to respond_to(:capacity) }

  it { is_expected.to respond_to(:capacity).with(1).argument }

end