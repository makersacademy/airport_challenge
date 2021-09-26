require "weather"

describe Weather do
  it { is_expected.to respond_to(:CONDITIONS) }
  it { is_expected.to respond_to(:get_condition) }
end
