require './lib/weather.rb'

describe Weather do
  it 'Test if weather is sunny or stormy' do
    expect(subject.is_sunny?).to eq(true).or eq(false)
  end
end
