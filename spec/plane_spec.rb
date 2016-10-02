require './lib/plane'
require './lib/airport'

describe Plane do
  let(:airport) {double("airport", :adverse_weather? => false, :add => true, :remove => true, :planes => [subject], :full? => false)}
  let(:airport2) {double("airport", :adverse_weather? => false, :add => true, :remove => true, :planes => [], :full? => false)}
  let(:stormy_airport) {double("airport", :adverse_weather? => true, :add => true, :remove => true, :planes => [subject], :full? => false)}
  let(:full_airport) {double("airport", :planes => [subject], :adverse_weather? => false, :add => true, :remove => true, :full? => true)}

  it 'can take off from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'can land at an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'tells the controller it has landed' do
    subject.land(airport)
    expect(subject.status).to eq("Landed at airport " + airport.to_s)
  end

  it "makes airport add it to its planes when it lands" do
    expect(airport).to receive(:add).with(subject)
    subject.land(airport)
  end

  it 'tells the controller it has taken off' do
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.status).to eq("Has taken off from airport " + airport.to_s)
  end

  it "makes airport remove it from its planes when it takes off" do
    subject.land(airport)
    expect(airport).to receive(:remove).with(subject)
    subject.take_off(airport)
  end

  it "doesn't take off when the weather is stormy" do
    expect{subject.take_off(stormy_airport)}.to raise_error("Cannot complete: adverse weather")
  end

  it "doesn't land when the weather is stormy" do
    expect{subject.land(stormy_airport)}.to raise_error("Cannot complete: adverse weather")
  end

  it "doesn't land when the airport has reached capacity" do
    expect{subject.land(full_airport)}.to raise_error("Cannot land at a full airport")
  end

  it "doesn't take off from an airport it's not in" do
    expect{subject.take_off(airport2)}.to raise_error("Cannot take off from an airport I'm not in")
  end

  it "cannot take off if it is flying" do
    subject.take_off(airport)
    expect{subject.take_off(airport)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
    expect{subject.take_off(full_airport)}.to raise_error("Already flying... Has taken off from airport " + airport.to_s)
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
