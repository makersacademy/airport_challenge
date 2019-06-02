require 'planes'

RSpec.describe Planes do

  it { is_expected.to respond_to :flying }
  
  describe '#taken_off' do
    it 'plane has take off' do
      expect(subject.taken_off).to eq true
    end
  end

  describe '#landed' do
    it 'plane has landed' do
      expect(subject.landed).to eq false
    end
  end

#  it 'plane has take off' do
#    subject.taken_off 
#    expect(subject).to be_taken_off
#  end
end
