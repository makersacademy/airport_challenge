require './lib/plane'
require './lib/airport'

describe Plane do
  let(:airport) {double("airport")}
  let(:airport2) {double("airport")}

  it 'can take off from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'can land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'tells the controller it has landed' do
    allow(airport).to receive(:add).with(instance_of(Plane))
    subject.land(airport)
    expect(subject.status).to eq("Landed at airport " + airport.to_s)
  end

  it "makes airport add it to its planes when it lands" do
    allow(airport).to receive(:add).with(instance_of(Plane))
    subject.land(airport)
    expect(airport).to receive(:add).with(subject)
  end

  it 'tells the controller it has taken off' do
    allow(airport).to receive(:remove).with(instance_of(Plane))
    subject.take_off(airport)
    expect(subject.status).to eq("Has taken off from airport " + airport.to_s)
  end

  it "makes airport remove it from its planes when it takes off" do
    allow(airport).to receive(:remove).with(instance_of(Plane))
    subject.take_off(airport)
    expect(airport).to receive(:remove).with(subject)
  end

  it "doesn't take off when the weather is stormy" do
    allow(airport).to receive(:weather).and_return("storm")
    expect{subject.take_off(airport)}.to raise_error("Cannot take off in adverse weather")
  end

  it "doesn't land when the weather is stormy" do
    allow(airport).to receive(:weather).and_return("storm")
    expect{subject.land(airport)}.to raise_error("Cannot land in adverse weather")
  end

  it "doesn't land when the airport has reached capacity" do
    allow(airport).to receive(:capacity).and_return(Airport::DEFAULT_CAPACITY)
    expect{subject.land(airport)}.to raise_error("Cannot land - airport is full")
  end

  it "doesn't take off from an airport it's not in" do
    allow(airport).to receive(:planes).and_return([])
    expect{subject.take_off(airport)}.to raise_error("Cannot take off from an airport I'm not in")
  end

  it "cannot take_off if it is flying" do
    subject.take_off(airport)
    expect{subject.take_off(airport)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
    expect{subject.take_off(airport2)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
  end

  it "cannot land again if it has already landed" do
    subject.land(airport)
    expect{subject.land(airport)}.to raise_error("Already landed... Landed at airport " + airport.to_s)
    expect{subject.land(airport2)}.to raise_error("Already landed... Landed at airport " + airport.to_s)
  end

  it "has a not in operation status if we have not told it to land or take off yet" do
    expect(subject.status).to eq("Not in operation")
  end
end
