require 'weather.rb'

describe Weather do

  it 'should respond to stormy' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'should return a random boolean' do
    expect(subject.stormy?).to eq(true). or eq(false)
  end

end