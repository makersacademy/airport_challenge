require 'weather'

describe Weather do

  it 'creates a random number between 0 and 1' do
    expect(subject.random).to be_a Integer
  end

  it 'assigns the random number a value to determine the state of the weather' do
    subject.random == 0
    expect(subject.current).to be_a String
  end
end
