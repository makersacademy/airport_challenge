require "plane"

describe Plane do


  it { is_expected.to respond_to :landed?}


  it "Is Landed by default" do
    expect(subject.landed?).to eq true
  end






end
