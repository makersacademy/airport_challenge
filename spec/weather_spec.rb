require './lib/weather.rb'

describe Weather do
  it 'Check if weather is sunny' do
    expect(subject.is_sunny?).to eq(true).or eq(false)
  end
end
