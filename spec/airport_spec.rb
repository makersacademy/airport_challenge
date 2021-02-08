require 'airport'
require 'plane'

describe Airport do

  it "it is at or past capacity" do
    $def_capacity = 10
    expect(subject.full?).to eq(true)
  end
  it "it is not at capacity" do
    $def_capacity = 12
    expect(subject.full?).to eq(false)
  end

  it "doesn't land" do
    expect(Airport.new.land(:plane)).to eq(false) if Airport.new.full?
  end
  it "lands" do
    expect(Airport.new.land(:plane)).to eq(true) if (!Airport.new.full?)
  end

  it "default capacity can be changed" do
    expect($def_capacity).to be_a(Integer)
  end

end
