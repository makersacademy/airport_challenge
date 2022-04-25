require 'Airport'
require 'Plane'
require 'Weather'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'plane is no longer in the airport after takeoff' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    a = Plane.new
    subject.land(a)
    subject.takeoff(a)
    expect(subject.planes).not_to include a
  end

  it "plane won't land if airport is full" do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land(Plane.`new) }.to raise_error
  end

  it "plane won't takeoff if not in airport" do
    plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error
  end

  it "airport will accept changes in capacity and not accept planes over it" do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.capacity = 30
    30.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error
  end

  it "airport will accept changes in capacity and will accept plane upto it" do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.capacity = 30
    29.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.not_to raise_error
  end

  it "won't allow takeoff if the weather is stormy" do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)
    p = Plane.new
    subject.planes << p
    expect { subject.takeoff(p) }.to raise_error
  end

  it "won't allow landing if the weather is stormy" do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.land(Plane.new) }.to raise_error
  end

end
