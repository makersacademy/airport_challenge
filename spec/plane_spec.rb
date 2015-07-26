
require 'plane'

describe Plane do

  it {is_expected.to respond_to :flying?}


  it 'is flying when created' do
    Plane.new
    expect(subject).to be_flying
  end

  it 'can land' do
    subject.land
    expect(subject).not_to be_flying
  end

  it 'is landed after landing' do
    subject.land
    expect(subject.status).to eq "landed"
  end

  it 'can take off' do
    subject.takeoff
    expect(subject).to be_flying
  end

  it 'is flying after take off' do
    subject.takeoff
    expect(subject.status).to eq "flying"
  end

end
