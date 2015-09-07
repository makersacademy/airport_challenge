require 'plane'

describe Plane do

  it { is_expected.to respond_to :flying?}

  it { is_expected.to respond_to :landed?}

  it 'is flying when created' do
	subject.flying?
	expect(subject.flying?).to be_truthy
  end

  it 'can land' do
  	subject.land
  	expect(subject.land).to be_falsey
  end


  it 'is landed after landing' do
  	subject.land
  	expect(subject.landed?).to be_truthy
  end

  it 'can take off' do
  	subject.land
  	subject.take_off
  	expect(subject.take_off).to be_truthy
  end

end
