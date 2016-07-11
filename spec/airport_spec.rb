require 'airport'
#require 'weather'

describe Airport do
  it "should check if plane has landed" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land_plane(double(:plane))
    expect(subject.airport.length).to eq 1
  end

  it "should check if plane has departed and not in airport" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land_plane(double(:plane))
    subject.take_off
    expect(subject.airport.empty?).to eq true
  end

  it "check if airport is full" do

    allow(subject).to receive(:stormy?).and_return(false)
    20.times { subject.land_plane(double(:plane)) }
    expect(subject.full?).to be true
  end

  it "should not allow planes to land if airport if full" do
    allow(subject).to receive(:stormy?).and_return(false)
    20.times { subject.land_plane(double(:plane)) }
    expect(subject.full?).to be true
    expect { subject.land_plane(double(:plane)) }.to raise_error("Airport is full")
  end


  it "should check that planes can't take off when stormy" do

  allow(subject).to receive(:stormy?).and_return(true)
  expect { subject.take_off }.to raise_error("weather is not suitable for take off")
  end
end
