require './lib/weather.rb'

describe Weather do
  before(:each) do
    @weather = Weather.new
  end

  it 'should return stormy 5% of time (IE if rand returns a 20)' do
    allow(@weather).to receive(:rand).with(1..20).and_return(20)

    expect(@weather.stormy?).to eq(true)
  end

  it 'should return sunny 95% of the time (IE if rand returns a number between 1 and 19)' do
    (1..19).each do |number|
      allow(@weather).to receive(:rand).with(1..20).and_return(number)

      expect(@weather.stormy?).to eq(false)
    end
  end
end
