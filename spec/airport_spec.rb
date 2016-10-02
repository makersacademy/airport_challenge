require 'plane'
require 'airport'

describe Airport do

  it { should respond_to :cleared_landing, :cleared_takeoff }

  it 'clears for landing' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes[0]).to eq plane
  end

  it 'clears for takeoff' do
    plane = Plane.new
    plane.takeoff(subject)
    expect(subject.planes).to be_empty
  end
end
