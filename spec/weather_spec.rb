require 'weather'

describe Weather do
  let(:weather) { Class.new { extend Weather } }

  it 'returns a type of weather' do
    expect([:clear, :stormy]).to include Weather.random
  end
end
