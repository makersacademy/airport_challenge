require 'weather'
require 'plane'
require 'airport'

describe Weather do
  subject(:weather) { described_class.new }

  it 'responds to #stormy? with boolean' do
    expect([true, false]).to include Weather.stormy?
  end
end
