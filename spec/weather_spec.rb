require 'weather'
require 'plane'
require 'airport'

describe Weather do
  it 'responds to #stormy? with boolean' do
    expect([true,false]).to include Weather.stormy?
  end
end
