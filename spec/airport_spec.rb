require 'airport'

describe Airport do
  let(:plane) {double(:plane, airbourne:true)}
  let(:airport) {Airport.new}

  before do
    allow(subject).to receive(:stormy?) {false}
  end

  it 'should check for plane landed' do
    allow(subject).to receive(:stormy?) {false}
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'should check for plane takeoff' do
    airport.land(plane)
    expect(airport.take_off(plane)).to eq(plane)
  end

  it 'plane cant land if airports full' do
    subject.capacity.times{subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error("Airport full")
  end

  let(:landed_plane) {double(:landed_plane, airbourne:false)}
  it 'grounded planes cant land' do
    expect{subject.land(landed_plane)}.to raise_error("Plane grounded")
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'capacity can be overridden' do
    airport = Airport.new(50)
    allow(airport).to receive(:stormy?) {false}
    airport.capacity.times {airport.land(Plane.new)}
    expect{airport.land(Plane.new)}.to raise_error 'Airport full'
  end

  let(:airbourne_plane){double(:airbourne_plane, airbourne:true)}
  it "planes cant land when stormy" do
    allow(subject).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error("Adverse weather conditions")
  end

  it "planes cant take off when stormy" do
    subject.land(plane)
    allow(subject).to receive(:stormy?) {true}
    expect{subject.take_off(plane)}.to raise_error("Adverse weather conditions")
  end

  it 'checks planes at airport before takeoff' do
    allow(subject).to receive(:stormy?) {false}
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'airbourne planes cant take off' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq nil
  end

  it 'checks plane leaves airport after take off' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
  end
end
