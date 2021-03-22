require 'airport'
require 'weather'
require 'plane'

describe Airport do
  let(:subject) {Airport.new(3)}
  describe '#safe_landing' do
    it 'lands plane and sends to hangar' do
      expect{subject.safe_landing}.to change{subject.hangar.length}.by 1
    end
    
    context 'landing in unsafe conditions' do
      it 'raises error in unsafe conditions' do
        expect{subject.safe_landing}.to raise_error{'unsafe conditions'}
      end
    end
  end

  describe '#safe_takeoff' do
  it 'take off plane and remove from hangar' do
    expect{subject.safe_takeoff}.to change{subject.hangar.length}.by -1
  end
  
  context 'take off in unsafe conditions' do
    it 'raises error in unsafe conditions' do
      expect{subject.safe_takeoff}.to raise_error{'unsafe conditions'}
    end
  end

  describe '#full_airport' do
    it 'prevents landing if airport is at capacity' do
      expect{subject.safe_landing}.to raise_error{'airport is full'}
    end
end


end
