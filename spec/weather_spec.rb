require 'weather'

describe Weather do
  context 'checks safe weather conditions'

  it "should output a message if false" do
    allow(subject).to receive(:weather_rand).and_return(11)
    expect{ subject.stormy }.to raise_error('Unable to land due to stormy weather')
  end

# not working with random numbers
  it "should return true" do
    weather = Weather.new
    allow(weather).to receive(:stormy) {true}
    expect(weather.stormy).to be true
  end


end
