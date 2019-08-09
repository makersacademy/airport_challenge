require 'weather'

describe Weather do
  it 'has a weather rating from 1 to 10' do
    expect(subject.weather_rating).to be_between(1, 10)
  end
  it 'can check if it is stormy' do
    expect(subject.stormy?).to be(true).or be(false)
  end
end
