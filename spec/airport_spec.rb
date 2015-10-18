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

  describe "#instruct_to_land" do

  context "when plane has landed" do
  it "reports parked plane" do
    plane
    subject.instruct_to_land(plane)
    expect(subject.plane).to eq plane
  end
  end

  context "when airport (with a capacity of one plane) is full" do
  it "informs plane cannot land" do
    plane
    subject.instruct_to_land(plane)
    expect{subject.instruct_to_land(plane)}.to raise_error("The airport is full")
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

end

end
