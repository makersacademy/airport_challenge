
require 'weather'

describe Weather do

  it 'should respond to weather generator' do
    expect(subject).to respond_to(:weather_generator)
  end

  it 'should respond to random number generator' do
    expect(subject).to respond_to(:random_number_generator)
  end

  it 'should return random number less than 11' do
    expect(subject.random_number_generator).to be < 11
  end

  it 'should return random number greater than 0' do
    expect(subject.random_number_generator).to be > 0
  end
end
