require "weather.rb"

describe Weather do
  it 'responds to weather' do
    expect(subject).to respond_to(:weather)
  end
  it 'gives a random number between 1 and 10' do
    expect(subject.weather).to be_between(1, 10)
  end
  it 'responds to check' do
    expect(subject).to respond_to(:check)
  end
end
