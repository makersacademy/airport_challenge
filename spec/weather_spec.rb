require_relative "../lib/weather"

describe Weather do

  it { is_expected.to respond_to :stormy? }
  
  it '#stormy returns true if the random number is 0' do
    random_number = 0
    today = Weather.new(random_number)
    expect(today.stormy?).to eq true
  end

  it '#stormy returns false if the random number is not 0' do
    random_number = 3
    today = Weather.new(random_number)
    expect(today.stormy?).to eq false
  end

end
