require 'airport'

describe Airport do
  let(:plane) {double(:plane, airbourne:true)}
  let(:airport){ Airport.new}

  it {should respond_to(:land).with(1).arguments }
  it {should respond_to(:take_off)}
  it {should respond_to(:stormy?)}

  before do
    allow(subject).to receive(:stormy?) {false}
  end

  it 'should check for plane landed' do
    expect(subject.land(plane)).to eq([plane])
  end

  it 'should check for plane takeoff' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq(plane)
  end

  it 'plane cant land if airports full' do
    subject.capacity.times{subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error("Airport full")
  end

  let(:landed_plane) {double(:landed_plane, airbourne:false)}
  it 'grounded planes cant land' do
    expect{subject.land(landed_plane)}.to raise_error("Plane is already on the ground")
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

  let(:airbourne_plane){double(:airbourne_plane, flying:true)}
  it "planes cant land when stormy" do
    allow(subject).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error("Adverse weather conditions, preventing landing")
  end

  it "planes cant take off when stormy" do
    subject.land(plane)
    allow(subject).to receive(:stormy?) {true}
    expect{subject.take_off(plane)}.to raise_error("Adverse weather conditions, preventing landing")
  end


  it 'checks planes at airport before takeoff' do
    airport = Airport.new
    allow(airport).to receive(:stormy?) {false}
    subject.land(plane)
    expect(airport.take_off(plane)).to be nil
    expect(subject.planes.last).to eq(subject.take_off(plane))
  end

  it 'airbourne planes cant take off' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq nil
  end

  it 'checks plane leaves airport after take off' do
    subject.land(plane)
    expect(subject.take_off(plane)).not_to eq (:planes)
  end


end
