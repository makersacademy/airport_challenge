require 'airport.rb'

describe Airport do

  it "lands a plane" do
    expect(subject.land).to be_landed 
  end

end
