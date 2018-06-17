require 'plane'

describe Plane do

  it { should respond_to(:land) }

  it { should respond_to(:take_off) }

  it { should respond_to(:at_airport?) }

  it "can confirm it is no longer in the airport" do
    subject.take_off
    expect(subject).to_not be_at_airport
  end

  it "can confirm it is at the airport" do
    subject.land
    expect(subject).to be_at_airport
  end
  
end
