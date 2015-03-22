require 'plane'

describe Plane do

  it { is_expected.to respond_to :flying }
  it 'should be in the air when created' do
    expect(subject.flying).to be true
  end
  it { is_expected.to respond_to :take_off }
  it 'should not be able to take off if flying' do
    expect { subject.take_off }.to raise_error 'cannot take off'
  end
  it 'should be able to take off if not flying' do
    subject.flying = false
    expect(subject.take_off).to be true
  end
  it 'changes its status to flying after taking off' do
    subject.flying = false
    subject.take_off
    expect(subject.flying).to be true
  end
  it { is_expected.to respond_to :land }
  it 'should not be able to land if not flying' do
    subject.flying = false
    expect { subject.land }.to raise_error 'cannot land'
  end
  it 'changes its staus to not fyling after landing' do
    subject.land
    expect(subject.flying).to be false
  end

end
