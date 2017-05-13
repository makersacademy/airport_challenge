require 'weather'

describe Weather do
  it "responds to #stormy?" do
    is_expected.to respond_to(:stormy?)
  end
end
