require 'plane'

describe Plane do

  # Repsonds to landed method
  it { is_expected.to respond_to :landed? }

  # Responds to attribute
  it { is_expected.to respond_to :landed }

  # Returns landed is false when created, as it is in the air currently
  it 'Landed is set to default false when landed method called' do
    expect(subject.landed).to eq false
  end

  # Specify plane landed is true i.e when aiport land plane is called or create plane already landed
  it 'Give Plane a true argument for landed' do
    plane = Plane.new(true)
    expect(plane.landed).to eq true
  end
end
