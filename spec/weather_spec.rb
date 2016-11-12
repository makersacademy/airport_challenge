require './lib/weather'

describe Weather do

  it 'generates weather code' do
    expect(subject.weather_code).to be_a_kind_of(Integer)
  end

  it { is_expected.to respond_to :stormy? }

  it 'returns "true" when it is stormy' do
    subject.weather_code = 1
    expect(subject.stormy?).to eq true
  end

  it 'returns "false" when it is not stormy' do
    subject.weather_code = 5
    expect(subject.stormy?).to eq false
  end





end
