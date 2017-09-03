require 'weather'

describe Weather do

  let(:weather) {Weather.new }
  it 'creates a weather object' do
  expect(:weather).to eq(:weather)
  end

describe '#number' do
  it 'will create a random number' do
  expect(weather.number).to be_between(0, 100)
    end
  end

describe '#storm' do
  it 'will either be stormy or sunny' do
    expect(weather.stormy?).to eq(true).or(eq(false))
  end
 end
end


#It is either going to return true or false

=begin

def stormy
number > 70 ? true : false
=end
