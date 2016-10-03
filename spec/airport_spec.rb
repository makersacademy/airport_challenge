require "airport"

describe Airport do

  let(:plane) { double :plane }

  it "accepts planes landing" do
    expect(subject.land(plane)).to eq "Bing bong: Landed safe and sound!"
  end

  it "won't allow landing plane if airport full" do
    subject.capacity.times{ subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error "Airport is full. Unable to land."
  end

  it "accepts planes taking off" do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq "This is your captain speaking, we are off into the sky!"
  end

  it "doesn't allow planes to take off when airport is empty" do
    expect(subject.take_off(plane)).to eq "There are no grounded planes at the airport."
  end

end
