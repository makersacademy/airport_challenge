require 'plane'

describe Plane do

  it "has an initial landed_status set to false" do
    expect(subject.landed_status).to eq false
  end

end
