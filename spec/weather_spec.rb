require 'weather'

describe Weather do
  # responds to stormy? method 
  it { is_expected.to respond_to :stormy? }
end
