require 'plane'
describe Plane do


  it 'plane has flying status on creation' do
      expect(subject.status).to eq :flying
  end

  it 'checks plane status is landed after land' do
    subject.land
    expect(subject.status).to eq :landed
  end

  it 'check plane is flying after take off' do
    subject.land
    subject.take_off
    expect(subject.status).to eq :flying
  end

end
