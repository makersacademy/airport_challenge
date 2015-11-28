require 'weather'

describe Weather do

  it 'returns true of false if the weather is stormy.' do
    expect([true, false]).to include Weather.stormy?
  end

end
