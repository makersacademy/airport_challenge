require 'weather'

describe Weather do
  let(:weather) { described_class.new }

  it { is_expected.to respond_to(:stormy?) }

  it 'is normally sunny but on rare occasions it may be stormy' do
    # Assuming at most 100 tries are sufficient to generate
    # atleast one stormy weather with 10% odds
    weather = nil
    100.times do
      weather = Weather.new
      break if weather.stormy?
    end
    expect(weather.stormy?).to eq true
  end

end
