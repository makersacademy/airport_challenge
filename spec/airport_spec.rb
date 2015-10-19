require 'airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
    @plane2 = Plane.new
  end

  it "does not allow planes to land if full" do
    allow(subject).to receive(:weather_warning).and_return("Fine")
    Airport::DEFAULT_CAPACITY.times do subject.land(Plane.new) end
    expect { subject.land(@plane) }.to raise_error "Airport full - cannot land plane"
  end

  it "does not allow planes to land if weather is stormy" do
    allow(subject).to receive(:weather_warning).and_return("Stormy")
    expect { subject.land(@plane) }.to raise_error "Stormy weather - cannot land plane"
  end

  it "does not allow planes to take off if they're not already at the airport" do
    allow(subject).to receive(:weather_warning).and_return("Fine")
    subject.land(@plane)
    expect { subject.take_off(@plane2) }.to raise_error "This plane isn't at the airport"
  end

  it "make weather stormy" do
    expect(subject.weather_warning).to eq(:Stormy).or eq(:Fine)
  end
end
