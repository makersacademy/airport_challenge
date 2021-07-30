require 'weather'

describe Weather do
  let(:weather) { Class.new { extend Weather } }

  it 'returns a random weather type' do
    expect([:clear, :stormy]).to include weather.random
  end
end
