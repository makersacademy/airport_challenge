require './lib/Weather'

describe Weather do
  it 'Weather should repond to request for forecast' do
    expect(subject).to respond_to :forecast
  end
  it 'Weather should repond to request for forecast with one of two values' do
    expect(subject.forecast).to eq("Sunny").or eq("Stormy")
  end
  # it 'Force sunny' do
  #   allow(Weather).to receive(:forecast).and_return(:"Sunny")
  #   expect(subject.forecast).to eq("Sunny")
  # end
  # it 'Force stormy' do
  #   allow(Weather).to receive(:forecast).and_return(:"Stormy")
  #   expect(subject.forecast).to eq("Stormy")
  # end
end