require 'weather'

describe Weather do
  it "checks for weather conditions" do
  expect(subject).to respond_to(:is_stormy?)
  end
end
