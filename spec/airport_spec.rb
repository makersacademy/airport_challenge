require 'airport'

describe Airport do

  let(:plane) {double(:plane, flying?: true, land: false)}

  it 'airport instructs plane to land' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end

  it 'airport instructs plane to take off' do
    expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
  end

  it 'airport has a limited capacity' do
    expect(subject).to respond_to(:capacity)
  end

  describe "#instruct_to_land" do

  context "when plane has landed" do
    it "reports parked plane" do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(plane).to receive(:at_airport).with(subject)
    plane
    subject.instruct_to_land(plane)
    expect(subject.planes).to eq [plane]
  end
  end

  context "when airport is stormy" do
  it "informs plane cannot land" do
    allow(subject).to receive(:stormy?).and_return(true)
    subject.stormy?
    plane
    expect{subject.instruct_to_land(plane)}.to raise_error("Weather is too stormy to land")
  end
  end

  context "when airport is full" do
  it "informs plane cannot land" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.capacity.times do
    expect(plane).to receive(:at_airport).with(subject)
    plane
    subject.instruct_to_land(plane)
    end
    expect{subject.instruct_to_land(plane)}.to raise_error("The airport is full")
  end
  end

end

  describe "#instruct_to_take_off" do

  context "when airport is stormy" do
  it "informs plane cannot take off" do
    allow(subject).to receive(:stormy?).and_return(true)
    subject.stormy?
    plane
    expect{subject.instruct_to_take_off(plane)}.to raise_error("Weather is too stormy to take off")
  end
  end

  context "when plane is flying" do
  it "informs plane cannot take off" do
    allow(subject).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:report_flying).and_return(true)
    allow(plane).to receive(:flying?).and_return(true)
    plane
    plane.report_flying
    expect{subject.instruct_to_take_off(plane)}.to raise_error("Plane flying cannot take off")
  end
  end

end

  describe "#capacity" do

  context 'when no capacity is mentioned' do
    it 'airport has default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'when capacity is mentioned' do
    it 'default capacity is overriden' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq(30)
    end
  end

  end

end
