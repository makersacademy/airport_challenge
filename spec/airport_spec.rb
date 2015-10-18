require 'airport'

describe Airport do

  let(:plane) {double(:plane)}

  it 'airport instructs plane to land' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end

  it 'airport instructs plane to take off' do
    expect(subject).to respond_to(:instruct_to_take_off).with(1).argument
  end

  it 'airport has to take into account stormy weather' do
    subject.report_stormy
    expect(subject).to be_stormy
  end

  it 'airport adapts instructions when weather is stormy' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'airport has a limited capacity' do
    expect(subject).to respond_to(:capacity)
  end

  describe "#instruct_to_land" do

  context "when plane has landed" do
  it "reports parked plane" do
    plane
    subject.instruct_to_land(plane)
    expect(subject.planes).to eq [plane]
  end
  end

  context "when airport is stormy" do
  it "informs plane cannot land" do
    subject.report_stormy
    plane
    expect{subject.instruct_to_land(plane)}.to raise_error("Weather is too stormy to land")
  end
  end

  context "when airport is stormy" do
  it "informs plane cannot take off" do
    subject.report_stormy
    plane
    expect{subject.instruct_to_take_off(plane)}.to raise_error("Weather is too stormy to take off")
  end
  end

  context "when airport is full" do
  it "informs plane cannot land" do
    subject.capacity.times do
    plane
    subject.instruct_to_land(plane)
    end
    expect{subject.instruct_to_land(plane)}.to raise_error("The airport is full")
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
