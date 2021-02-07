require 'airport'
require 'plane'

describe Airport do

  it "it is at or past capacity" do
    expect(subject.full?).to eq(true)
  end

  it "doesn't land" do
    expect(Airport.new.land(:plane)).to eq(false) if Airport.new.full?
  end
  it "lands" do
    expect(Airport.new.land(:plane)).to eq(true) if (Airport.new.full? == false)
  end

end
