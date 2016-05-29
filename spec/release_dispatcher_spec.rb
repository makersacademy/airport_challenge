require 'release_dispatcher'

describe ReleaseDispatcher do

  context 'When the airport is full' do
    it '#travel_allowed? returns false' do
      airport = double(:airport, full?: true)
      expect(subject.travel_allowed?(airport)).to eq false
    end
  end  
  
  context 'When the airport is NOT full' do

    context 'and the weather is good' do
      it '#travel_allowed? returns true' do
        allow_any_instance_of(Weather).to receive_messages(stormy?: false)
        airport = double(:airport, full?: false)
        expect(subject.travel_allowed?(airport)).to eq true
      end
    end

    context 'and the weather is bad' do
      it '#travel_allowed? returns false' do
        allow_any_instance_of(Weather).to receive_messages(stormy?: true)
        airport = double(:airport, full?: false)
        expect(subject.travel_allowed?(airport)).to eq false
      end
    end
  end  
end
