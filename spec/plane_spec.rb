require 'plane'

describe Plane do

  it 'Plane is flying when created' do
    expect(subject).to be_flying
  end

  it 'Plane can respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'Plane is landed after landing' do
    subject.land
    expect(subject.flying?).to eq(false)
  end

  it 'Plane can take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'Plane is flying after take off' do
    subject.take_off
    expect(subject.flying?).to eq(true)
  end

end

