require 'airport'

describe Airport do

let(:airport) { described_class.new}

  it 'responds to instruct_takeoff' do
    expect(airport).to respond_to :instruct_takeoff
  end

  it 'instructs a plane to take off, which is then flying' do
    plane = airport.instruct_takeoff
    expect(plane).to be_flying
  end

end