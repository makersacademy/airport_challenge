require 'airport'

describe Airport do

  let(:plane) {double :plane}
  let(:weather){double :weather, stormy?: false}
  
  subject {described_class.new weather}

  it {is_expected.to respond_to(:land).with(1).argument}
  
  it 'cannot land a plane in stormy weather' do
    allow(weather).to receive(:stormy?).and_return true
    expect{subject.land(:plane)}.to raise_error 'too stormy'
  end

  it 'can launch a plane' do
    subject.land plane
    expect(subject.launch).to be plane
  end

  it 'will raise an error if there is no plane to launch' do
    expect{subject.launch}.to raise_error 'no planes' 
  end

  it 'will not launch a plane if stormy' do
    subject.land plane
    allow(weather).to receive(:stormy?).and_return true
    expect{subject.launch}.to raise_error 'too stormy'
  end
end
