require 'weather'

describe Weather do

  it {expect(subject.class).to eq(Weather)}
  it {expect(Weather).to respond_to(:stormy_weather?)}

end
