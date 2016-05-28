require 'airport'

describe Airport do
  it "responds to confirm_landed method with 1 argument (i.e. specific plane)" do
  expect(subject).to respond_to(:confirm_landed).with(1).argument
  end

  # it "confirms"

end