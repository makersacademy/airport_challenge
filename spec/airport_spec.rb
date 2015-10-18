require 'airport'

describe Airport do

  #let(:weather) { double :weather }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "does not allow planes to land if full" do
    allow(subject.weather).to receive(:weather_warning).and_return("Fine")
    Airport::DEFAULT_CAPACITY.times do subject.land(Plane.new) end
    expect { subject.land(Plane.new) }.to raise_error "Airport full - cannot land plane"
  end

  it "does not allow planes to land if weather is stormy" do
    allow(subject.weather).to receive(:weather_warning).and_return("Stormy")
    expect { subject.land(Plane.new) }.to raise_error "Stormy weather - cannot land plane"
  end

  it "does not allow planes to take off if they're not already at the airport" do
    allow(subject.weather).to receive(:weather_warning).and_return("Fine")
    subject.land(Plane.new)
    expect { subject.take_off(Plane.new) }.to raise_error "This plane isn't at the airport"
  end

end
