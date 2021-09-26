require 'weather'

describe Weather do
  it 'asks if the weather is stormy' do
    expect(Weather.new.stormy?).to eq true
  end
end