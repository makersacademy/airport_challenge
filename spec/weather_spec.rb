require 'weather'

describe Weather do
  it 'should generate a random integer between 0 and 2' do
    expect(subject.random_number).to be_between(0, 2).inclusive
  end
end
