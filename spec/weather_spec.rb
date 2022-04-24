require 'weather'

describe Weather do

  it 'initializes with a weather constant' do
    expect(Weather::WEATHER).to eq [:sunny, :rainy, :stormy, :windy]
  end

  it 'responds to stormy? method' do
    expect(Weather).to respond_to :stormy?
  end

  xit 'responds with true or false to stormy?' do
    expect(Weather.stormy?).to be_in([true, false])
  end

end