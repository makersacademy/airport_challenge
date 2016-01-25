require 'weather'

describe Weather do

let(:including_class){ Class.new { include Weather }}
  it 'is mostly sunny'do
    a = []
    100.times{ a << including_class.new.check_weather }
    expect(a.count(:sunny)).to be > 50
  end
  it 'is sometimes stormy'do
    a = []
    100.times{ a << including_class.new.check_weather }
    expect(a.count(:stormy)).to be > 5
  end
end
