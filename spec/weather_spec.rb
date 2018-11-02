require "weather"

describe Weather do
  it { expect(subject).to respond_to(:report) }
end
