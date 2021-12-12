require 'weather'

describe Weather do
  it { is_expected.to respond_to 'stormy' }
  it { is_expected.to respond_to 'sunny' }
  
end