require './lib/plane.rb'

describe Plane do

  it 'responds to land method' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms that not at the airport' do
    expect(subject.take_off(@airport, @weather)).to eq("Plane is taking off")
  end

  it 'prevents landing when airport is full' do
    expect { subject.land('full', @weather) }.to raise_error("Airport is full")
  end

  it "doesn't allow take_off if the weather is stormy" do
    expect { subject.take_off(@airport, "stormy") }.to raise_error("Too stormy for take off!")
  end

  it 'lands to an airport' do
    expect(subject).to respond_to(:land).with(2).arguments
  end

  it 'takes off from an airport' do
    expect(subject).to respond_to(:take_off).with(2).arguments
  end

  it "doesn't allow landing if weather is stormy" do
    expect { subject.land(@airport, "stormy") }.to raise_error("Too stormy for landing!")
  end

end
