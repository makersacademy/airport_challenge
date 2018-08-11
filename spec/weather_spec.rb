require 'weather'

describe Weather do

  class Test
    include Weather
  end
  test = Test.new

  it 'returns #storm as true when 6 is selected randomly from the numbers 1 to 6' do
    allow(test).to receive(:rand) { 6 }
    expect(test.stormy_weather).to eq true
  end

  it 'returns #stormy as false when the numbers 1 to 5 are selected randomly from numbers 1 to 6' do
    allow(test).to receive(:rand) { 1 }
    expect(test.stormy_weather).to eq false
  end

end
