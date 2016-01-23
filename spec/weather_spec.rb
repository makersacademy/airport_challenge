require "weather"

describe Weather do
  subject(:weather){ described_class.new }
  it {is_expected.to respond_to :stormy?}

  it 'could be stormy or not' do
    expect([true, false]).to include subject.stormy?
  end
end