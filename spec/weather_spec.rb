require 'weather'

describe Weather do

  it 'Check if the weather is stormy' do
    expect(Weather.report).to be(true).or be(false)
  end
end
