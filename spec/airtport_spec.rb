require 'airport'

describe Airport do 

  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}
  
  it{is_expected.to respond_to(:planes)}

  describe 'arrival' do
    it {is_expected.to respond_to(:arrive).with(2).argument}
    
    it 'should receive a landing plane' do
    allow(weather).to receive(:storm?).and_return(false)
    subject.arrive(plane, weather)
    expect(subject.planes).to include(plane)
    end

    it 'when there is a storm planes cant arrive' do
      allow(weather).to receive(:storm?).and_return(true)
      expect{subject.arrive(plane)}.to raise_error
    end
  end

  describe 'departure' do
    it {is_expected.to respond_to(:depart).with(1).argument}
  
    it 'should let a plane depart' do
      subject.depart(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end
