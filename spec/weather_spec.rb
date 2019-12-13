require 'weather'

describe Weather do
  it 'creates instance of Weather' do
    expect(Weather.new).to be_a Weather
  end
end
