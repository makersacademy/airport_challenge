require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it {expect(weather).to respond_to(:stormy?)}
end
