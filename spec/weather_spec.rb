require 'weather'

describe Weather do
  context 'checks safe weather conditions'

  it "should output a message if false" do
    plane = Plane.new(999)
    allow(subject).to receive(:weather_rand).and_return(11)
    expect{ subject.stormy(plane) }.to raise_error('Unable to land due to stormy weather')
  end

  it "should return true" do
    weather = Weather.new
    allow(weather).to receive(:stormy).and_return true
    expect(weather.stormy).to be true
  end


end

# describe Airport do
#   let(:bad_weather) { double :weather, :stormy => true }
#   let(:airport) { described_class.new(bad_weather) }
#
#   it 'raises an error if the weather is stormy' do
#     expect(airport.take_off).to raise "Unable to land due to stormy weather"
#   end
# end
