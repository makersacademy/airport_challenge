require 'airport'
# require 'plane'

describe Airport do

  plane = Plane.new

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'has landed planes?' do
    expect(subject.planes?)
  end

  it 'lands planes' do
    expect(subject.land(plane)).to eq ("plane has landed")
  end

  it 'takes off planes' do
    expect(subject.take_off(plane)).to eq("plane has taken off")
  end

  # it 'doesnt allow take off when bad weather' do
  #   allow(bad_weather?).to receive {90}
  #   expect(subject.take_off(plane)).to eq("weather is too bad for take-off")
  # end

  it 'doesnt allow take off when bad weather' do
    bad_weather = double("bad_weather")
    allow(bad_weather).to receive(:rand).and_return(true)
    expect{subject.take_off(plane)}.to raise_error("weather is too bad for take-off")
  end

end
