require 'airport'

describe Airport do 

  let(:plane) {double(:plane)}
  
  it{is_expected.to respond_to(:planes)}

  describe 'arrival' do
    it {is_expected.to respond_to(:arrive).with(1).argument}
    
    it 'should receive a landing plane' do
    subject.arrive(plane)
    expect(subject.planes).to include(plane)
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
