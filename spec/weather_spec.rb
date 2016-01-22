require 'weather'

describe Weather do

  it 'is mostly sunny'do
    a = []
    100.times{ a << subject.check_weather }
    expect(a.count("sunny")).to be > 50
  end
  it 'is sometimes stormy'do
    a = []
    100.times{ a << subject.check_weather }
    expect(a.count("stormy")).to be > 5
  end
end
