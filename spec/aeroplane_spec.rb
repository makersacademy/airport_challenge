require "aeroplane"

describe Aeroplane do

  it "should land" do
    expect(subject.land).to eq true
  end

  it "should confirm it has landed" do
    expect(subject.confirm_landed).to eq true
  end

  it "should take off" do
    expect(subject.take_off).to eq true
  end

  it "should confirm it has taken off" do
    expect(subject.confirm_taken_off).to eq true
  end

end
