require 'weather'

describe Weather do

  it { is_expected.to respond_to(:random_weather) }
  it { is_expected.to respond_to(:stormy?) }

  it 'expects randomness' do
    tester = []
    500.times do
      tester << subject.random_weather
    end
    expect(tester).to include :stormy
  end




end
