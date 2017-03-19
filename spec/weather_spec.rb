require 'weather'

describe Stormy_Weather do

  it '#report returns either true or false' do
    expect(subject.report).to eq(true).or eq(false)
  end

end
