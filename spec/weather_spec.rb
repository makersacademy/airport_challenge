require 'weather'

describe Weather do
  subject(:Weather) {described_class}
  it {is_expected.to respond_to(:stormy?)}
  it {is_expected.to respond_to(:random_outlook)}
end
