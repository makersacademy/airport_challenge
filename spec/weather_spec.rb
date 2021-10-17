require './lib/Weather'

describe Weather do

  it 'Weather should repond to request for a forecast with one of two values' do
    20.times{expect(subject.forecast).to eq("Sunny").or eq("Stormy")}
  end
 
end