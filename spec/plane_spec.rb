require 'plane'

describe Plane do

it { is_expected.to respond_to :flying}
it { is_expected.to respond_to :landed}

it "is flying when initialized" do
  expect(subject.flying).to eq true
end

it "has landed when flying is false" do
  expect(subject.landed).to eq false
end

end
