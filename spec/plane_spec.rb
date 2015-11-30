require 'plane'
describe Plane do
  # let(:weather) {double :weather}
  #

  it 'plane has flying status on creation' do
      expect(subject.status).to eq :flying
  end

  it 'checks plane status is landed after land' do
    subject.land
    expect(subject.status).to eq :landed
  end

  it 'check plane is flying after take off' do
    subject.take_off
    expect(subject.status).to eq :flying
  end

  
  #
  # it 'prevent takeoff in stormy weather' do
  #   condition = double(weather)
  #   subject.stormy.to eq true
  #   expect{subject.takeoff}.to raise_error 'Stormy conditions not safe for takeoff'
  # end


end
