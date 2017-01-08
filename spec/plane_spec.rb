# /Users/shereen/Google Drive/Projects/airport_challenge/spec/plane_spec.rb

require "plane"

describe Plane do

  #1st story / 1st test
  it {is_expected.to respond_to :confirm_landed?}

  #1st story / Second test
  it "confirms to the airport it has landed" do
    expect(subject.confirm_landed?).to eq("I've landed!")
  end

end
