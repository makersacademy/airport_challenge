require 'weather.rb'

describe Weather do
  subject(:condition) { described_class.new }
  it { is_expected.to respond_to(:stormy) }
end
