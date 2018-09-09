require 'weather'

describe Weather do
  it 'the weather_random method returns either true or false at random' do
    20.times { expect(subject.weather_random).to eq(true).or(eq(false)) }
  end
end
