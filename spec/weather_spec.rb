require 'weather'

describe Weather do
  before(:each) do
    @forecast = Weather.new
  end

  it 'can be stormy' do
    expect(@forecast.stormy?(0.3)).to eq true
  end

  it 'can be sunny' do
    expect(@forecast.stormy?(0.31)).to eq false
  end
end
