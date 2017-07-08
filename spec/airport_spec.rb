require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:bigairport) { Airport.new(10) }

  it "responds to .full?" do
    expect(subject).to respond_to(:full?)
  end
  it "can take an argument at creation to set capacity" do
    expect(bigairport.capacity).to eq 10
  end
end
