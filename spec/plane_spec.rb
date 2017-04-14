require './lib/plane'

describe Plane do
  let(:airport) { double :airport, weather: "Stormy" }

  it "#planes can take off" do
    expect(subject).to respond_to(:takeoff)
  end

  it "#planes can land" do
    expect(subject).to respond_to(:land_at)
  end

  it "#planes can land at an #airport" do
    allow(airport).to receive(:weather).and_return("Sunny")
    subject.land_at(airport)
    expect(subject.landed_at).to eq airport
  end

  it "#planes can leave an #airport" do
    allow(airport).to receive(:weather).and_return("Sunny")
    subject.landed_at = airport
    subject.takeoff
    expect(subject.landed_at).to be nil
  end

  it "cannot #takeoff if already in flight" do
    expect { subject.takeoff }.to raise_error "Already in flight"
  end

  it "cannot #land if already in #landed_at an #airport" do
    allow(airport).to receive(:weather).and_return("Sunny")
    subject.landed_at = airport
    expect { subject.land_at(airport) }.to raise_error "Already landed at #{airport}"
  end

  it "cannot #land if #weather is #stormy #airport" do
    expect { subject.land_at(airport) }.to raise_error "Cannot land, weather stormy"
  end

  it "cannot #takeoff if #weather is #stormy #airport" do
    subject.landed_at = airport
    expect { subject.takeoff }.to raise_error "Cannot takeoff, weather stormy"
  end

end
