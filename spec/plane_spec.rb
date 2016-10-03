require 'plane'

describe Plane do
    subject(:plane) { described_class.new}

it { is_expected.to respond_to :flying}
it { is_expected.to respond_to :landed}

it "is flying when initialized" do
  expect(subject.flying).to eq true
end

it "has landed when flying is false" do
  expect(subject.landed).to eq false
end

it "has taken off when instructed" do
subject.landed
subject.take_off
expect(subject.take_off).to eq true


end

end
