# /Users/shereen/Google Drive/Projects/airport_challenge/spec/plane_spec.rb
require "plane"

describe Plane do
  #1st story / 1st test
  it {is_expected.to respond_to :confirm_landed?}

  #1st story / 4th test
  it "confirms to the airport it has landed" do
    expect(subject.confirm_landed?).to eq("I've landed!")
  end
end

describe Plane do
    #Second story / 2nd test
    it {is_expected.to respond_to :confirm_not_in_airport?}

  #2nd story / 4th test
  it "confirms to the airport it is not in the airport" do
    expect(subject.confirm_not_in_airport?).to eq("I'm not in the airport")
  end




end
