require 'spec_helper'

describe Airport do

  let(:plane) { double(:plane) }
  it "lands a plane in the airport and stores it" do
    expect(subject.land(plane)).to match_array(plane)
  end

end
