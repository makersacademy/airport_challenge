require 'airport'
require 'plane'
require 'weather'

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

  it "does not take off if stormy" do
    expect(Airport.new.take_off(:plane)).to eq(false) if Weather.new.stormy?
  end

  it "does take off if not stormy" do
    expect(Airport.new.take_off(:plane)).to eq(true) if (!Weather.new.stormy?)
  end

end
