require 'aeroplane'

describe Aeroplane do

  let(:airport){ double(:airport) }

  it "cannot take off if flying" do
    subject.flying = true
    expect(subject.take_off).to eq("Already flying!")
  end

  it "cannot land if already landed" do
    subject.land
    expect(subject.land).to eq("Already landed!")
  end

  it "must be in an airport if landed" do
  end
end
