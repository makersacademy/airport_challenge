describe Plane do

  it { is_expected.to respond_to :land } # message to Plane

  it { is_expected.to respond_to :take_off } # message to Plane

  it { is_expected.to respond_to :landed? } # message to Plane


  it 'confirms its status landed' do
    expect(subject.land).to eq true
  end

  it 'confirms its status taken-off' do
    expect(subject.take_off).to eq false
  end

  it 'confirms that it has changed state to landed' do
    subject.land
    expect(subject).to be_landed
  end

  it 'confirms that has changed state to taken-off' do
    subject.take_off
    expect(subject).to_not be_landed
  end

end
