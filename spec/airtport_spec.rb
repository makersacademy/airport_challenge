require 'airport'

describe Airport do 

  let(:plane) {double(:plane)}
  
  it{is_expected.to respond_to(:planes)}

  describe 'arrival' do
    it {is_expected.to respond_to(:arrive).with(1).argument}
    
    it 'should receive a landing plane' do
    subject.arrive(plane)
    expect(subject.planes).to eq plane
    end
  end


end
