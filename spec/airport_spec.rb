require 'airport'
require 'plane'

describe Airport do

attr_reader :plane

  let(:airport) {Airport.new}
  let(:capacity) {capacity = 10}

  it "it is at or past capacity" do
    expect(subject.full?).to eq(true)
  end

end
