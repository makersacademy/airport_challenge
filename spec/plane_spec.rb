require 'plane'

describe Plane do

  # Repsonds to landed method
  it { is_expected.to respond_to :landed? }

  # Responds to attribute
  it { is_expected.to respond_to :landed }

  # Returns true when plane is landed
  it 'Landed is set to default true when landed method called' do
    expect(subject.landed).to eq true
  end

  # Specify plane is false for landed
  it 'Give Plane a false argument when new object' do
    plane = Plane.new(false)
    expect(plane.landed).to eq false
  end
end
