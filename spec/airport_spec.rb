require 'airport'

describe Airport do
  it "responds to has landed method with 1 argument (i.e. specific plane)" do
  expect(subject).to respond_to(:has_landed).with(1).argument
  end
end