require 'airport'

describe Airport do

it "has a default capacity of 10 landing slots" do
  expect(subject.landing_slots).to eq(10)
end

end
