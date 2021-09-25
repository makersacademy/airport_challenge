require 'weather'

describe Weather do
  it 'responds to the method #forecast' do
    expect(subject).to respond_to(:forecast)
  end
end