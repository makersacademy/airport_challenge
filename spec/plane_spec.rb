require 'plane'

describe Plane do

  it "is an instance of the Plane class" do
    expect(subject.is_a?(Plane)).to eq(true)
  end

  xit "can be instructed to land" do
    expect(subject.land).to eq true
  end

  it "informs me it has landed" do
    expect(subject.land).to eq "#{subject} landed"
  end

  xit "can be instructed to takeoff" do
    expect(subject.take_off).to eq true
  end

  it "informs me it has taken off" do
    expect(subject.take_off).to eq "#{subject} has taken off"
  end


end
