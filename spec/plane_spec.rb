require 'plane'
describe Plane do
  it { is_expected.to respond_to :weather }
  it 'there is a storm' do
  (Plane.new).weather
  expect(subject).to be_storm
end
end