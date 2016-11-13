require 'airport'
require 'plane'
require 'weather'


RSpec.describe Weather do

  it "should report the weather when asked" do
  expect(subject).to respond_to(:report)
  expect(subject.report).to eq("Calm" || "Stormy")
end



end
