require 'weather'

describe Weather do
  it 'the weather_random method returns either true or false at random' do
    expect(subject.weather_random).to eq(true).or(eq(false))
  end
end
