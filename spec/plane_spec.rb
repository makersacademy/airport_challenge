require 'plane'

describe Plane do

  # Responds to flying
  it { respond_to(:flying?) }
  it { respond_to(:land) }
  it { respond_to(:takeoff) }

  # Provides boolean values
  it 'returns true or false from .flying?' do
    expect(subject.flying?).to eq(true).or eq(false)
  end

  it 'is not flying after landing' do
    subject.land
    expect(subject.flying?).to eq(false)
  end

  it 'is flying after takeoff' do
    subject.takeoff
    expect(subject.flying?).to eq(true)
  end

end
