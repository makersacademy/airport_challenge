require 'airport'

describe Airport do
  it { is_expected.to respond_to :full?}
  
  it { is_expected.to respond_to :capacity}
  
end
  