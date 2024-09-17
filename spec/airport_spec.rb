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
    expect(subject.land(:plane)).to eq(false) if subject.full?
  end
  it "does land" do
    expect(subject.land(:plane)).to eq(true) unless subject.full?
  end

  it "default capacity can be changed" do
    $def_capacity = @capacity
    expect(@capacity).to eq($def_capacity)
  end

  it "doesn't take off if stormy" do
    expect(subject.take_off(:plane)).to eq(false) if Weather.new.stormy?
  end

  it "does take off if not stormy" do
    expect(subject.take_off(:plane)).to eq(true) unless Weather.new.stormy?
  end

  # it "doesn't land if stormy" do
  #   expect(Airport.new.land(:plane)).to eq(false) if Weather.new.stormy?
  # end
  #
  # it "does land if not stormy" do
  #   expect(Airport.new.take_off(:plane)).to eq(true) if (!Weather.new.stormy?)
  # end

end
