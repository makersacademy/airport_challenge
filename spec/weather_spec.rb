require 'weather'

describe Weather do
  it 'should return true or false when sent #stormy?' do
    expect([true, false].include?(subject.stormy?)).to eq true
  end
end
