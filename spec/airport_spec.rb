require 'plane'
require 'airport'
describe Airport do
  it "expects to tell whether landing and taking_off is blocked or not " do
    expect(subject.blocked_airport).to eq false
  end
end
