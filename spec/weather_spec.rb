require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  it 'responds to #stormy' do
    expect(weather).to respond_to(:stormy?)
  end
end
