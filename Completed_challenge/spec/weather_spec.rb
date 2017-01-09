require 'weather'

describe Weather do

it {is_expected.to respond_to :stormy?}
it {is_expected.to respond_to :sunny?}

before :each do
  srand(3)
end

it "is stormy" do
expect(subject.stormy?).to eq(true)
end

it "is sunny" do
  expect(subject.sunny?).to eq(false)
end
end
