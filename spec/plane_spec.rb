require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject.status).to eql "flying"
  end

  it 'can land' do
    is_expected.to respond_to :land
  end

  it 'is landed after landing' do
    subject.land
    expect(subject.status).to eql "landed"
  end

  it 'can take off' do
    is_expected.to respond_to :take_off
  end

  it 'is flying after take off' do
    subject.take_off
    expect(subject.status).to eql "flying"
  end

end
