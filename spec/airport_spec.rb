require 'airport'

describe Airport do

  let(:plane) { double('plane') }
  subject do 
    Airport.new(10)
  end
  
  describe '#initialization' do
    it { expect(subject).to be_an_instance_of Airport }
  end

  describe '#land' do
    it 'allows a plane to land in the dock' do
      subject.land(plane)
      expect(subject.dock).to include plane
    end
    it 'raises an error when the dock is full' do
      10.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport dock is full'
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.dock).to eq []
    end
  end
  describe '#confirm_take_off' do
    it 'responds if a plane has taken off or not' do 
      subject.land(plane)
      expect(subject.confirm_take_off(plane)).to match /still in dock/
      subject.take_off(plane)
      expect(subject.confirm_take_off(plane)).to match /Successful takeoff/
    end
  end
end
