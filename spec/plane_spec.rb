require 'plane'

describe Plane do

  it "responds to 'landed?'" do
    expect(subject).to be_landed
    end

  it "responds to 'airborne?'" do
    expect(subject).to be_airborne
    end

end
