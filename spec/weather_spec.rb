require 'weather'

describe Weather do
  let(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  it 'is normally sunny but on rare occasions it may be stormy' do
    # Assuming at most 100 tries are sufficient to generate
    # atleast one stormy weather with 5% odds
    weather = Weather.new
    100.times do |i|
      break if weather.stormy?
      weather = Weather.new
    end
    expect(weather.stormy?).to eq true
  end

end
