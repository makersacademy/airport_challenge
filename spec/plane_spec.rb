require "plane"
describe Plane do
  it { expect(subject).to respond_to :land, :flying? }
end