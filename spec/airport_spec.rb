require "airport"
describe Airport do
  it { expect(subject).to respond_to :planes }
  it { expect(subject).to respond_to(:accept).with(1).argument }
end