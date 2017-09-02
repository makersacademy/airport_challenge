require 'weather'

describe Weather do
  it 'creates a weather object' do
  expect(subject).to eq(subject)
  end

describe '#number' do
  it 'will create a random number' do
  expect(subject.number).to be_between(0, 100)
    end
  end

describe '#storm' do
  it 'will either be stormy or sunny' do
  end
 end
end

#It is either going to return true or false
