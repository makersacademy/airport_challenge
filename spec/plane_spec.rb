require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject.status).to eq(Plane::DEFAULT_STATUS)
  end

  it 'can land' do
    expect(subject).to respond_to(:land)
  end

  it 'is landed after landing' do
    subject.land
    expect(subject).to be_landed
  end

  it 'can take off' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'is flying after take off' do
    subject.takeoff
    expect(subject).to be_tookoff
  end
end
