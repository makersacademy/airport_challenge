require 'weather'

describe Weather do
  it 'is mostly sunny'do
    a = []
    100.times do
      [] << Weather.new
      end
    expect(a.count(sunny)).to be > 50
    expect(a.count(stormy)).to be > 5
  end
end
