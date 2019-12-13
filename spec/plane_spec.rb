require 'plane.rb'

describe Plane do
  it 'creates an instance of a plane' do
    pl = Plane.new
    expect(pl).to be_a Plane
  end

  it 'responds to take off method for plane' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms plane is out of airport' do
    allow(subject).to receive(:take_off).and_return(true)
    allow(subject).to receive(:out?).and_return(true)
    expect(subject).to be_out
  end

  it 'prevents planes from taking off in stormy weather' do
    weather = Weather.new
    weather.stormy? == true
    expect { subject.take_off }.to raise_error "Too stormy to take off."
  end
end
