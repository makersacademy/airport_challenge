require_relative "../lib/weather"

describe Weather do

# let (:weather_is_stormy)  { double('weather is stormy'), stormy?: true }
# let (:weather_not_stormy)  { double('weather not stormy'), stormy?: false }

  it { is_expected.to respond_to :stormy? }
  
  it '#stormy returns true if the random number is 0' do
    allow(Kernel).to receive(:rand).with(3).and_return(0)
    today = Weather.new(Kernel.rand(3))
    expect(today.stormy?).to eq true
  end

  it '#stormy returns false if the random number is not 0' do
    allow(Random).to receive(:rand).with(3).and_return(2)
    today = Weather.new(Random.rand(3))
    expect(today.stormy?).to eq false
  end

end
