require 'airport.rb'

describe Airport do

  it "instructs plane to land" do
    expect(subject.land).to be_landed
  end

  it "instruct plane to take off" do
    expect(subject.take_off).to be_airborne
  end

end
