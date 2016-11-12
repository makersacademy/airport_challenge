require 'weather'

describe Weather do

  it 'should respond to weather generator' do
    expect(subject).to respond_to(:weather_generator)
  end

  it 'should respond to random number generator' do
    expect(subject).to respond_to(:random_number_generator)
  end

  it 'should return random number between 1 and 10' do
    expect(subject.random_number_generator).to be_kind_of(Fixnum)
  end

end
