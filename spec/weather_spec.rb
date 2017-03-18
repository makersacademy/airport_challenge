require 'weather'

describe Weather do

  # 1. #report - create weather
  it { is_expected.to respond_to(:report) }

  # 2. #report - sets @stormy_weather to either true or false
  it '#report - sets @stormy_weather to either true or false' do
    expect(subject.report).to eq(true).or eq(false)
  end


end
