require "weather"

describe Weather do

  # let(:forecast) {instance_double(Weather) }
  # let(:forecast) { Weather.new}


  it '#stormy? returns boolean' do
    # allow(forecast).to receive(true)
    # expect(subject.itslef).to eq(false) #å.or eq(false)
    # expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
    p subject == true
    p subject == false
    p subject == :sunny
    p subject == :stormy
  end
  
end


# let(:plane) { instance_double(Plane) }
#   let(:airport) { Airport.new(12, :sunny) }

#   before do
#     allow(plane).to receive(:instance_of?).with(Plane).and_return(true)
#     allow(plane).to receive(:flying?).and_return(true)
#     allow(plane).to receive(:landing)
#     allow(plane).to receive(:offtake)