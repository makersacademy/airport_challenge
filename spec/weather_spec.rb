require 'weather'
require 'airport'

describe Weather do

  it "weather is stormy?" do
    $def_weather = @stormy
    expect(subject.stormy?).to eq(true)
  end

end
