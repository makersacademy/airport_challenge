require 'airport'
require 'receive_dispatcher'

describe Airport do
  let(:vehicle) { double :vehicle }
  #not too happy about this variable below but need to keep houn happy
  let(:d) { Dispatcher } 

  context 'Initialization' do
    it 'responds to :new with no argument' do
      expect{Airport.new}.not_to raise_error
    end

    it 'responds to :new with one argument' do
      expect{Airport.new(22)}.not_to raise_error
    end

  end


  context 'In any context' do
    it {is_expected.to respond_to(:receive).with(1).argument }

    it {is_expected.to respond_to(:parked?).with(1).argument }

    it '#parked? returns false for a plane that is not in the airport' do
      expect(subject.parked?(vehicle)).to eq false
    end
  end


  context 'When travel is allowed by dispatcher' do
    #the allow_any_instance statements could be grouped under before(:all)
    #but the d cannot be used, so either Hound is happy or the code is DRY!
    it '#receive(veichle) should not raise an error' do
      allow_any_instance_of(d).to receive(:travel_allowed?).and_return(true)
      expect{subject.receive(vehicle)}.not_to raise_error
    end

    it '#parked? should return true after a plane has landed' do
      allow_any_instance_of(d).to receive(:travel_allowed?).and_return(true)
      subject.receive(vehicle)
      expect(subject.parked?(vehicle)).to be_truthy
    end
  end 


  context 'When travel is not allowed by dispatcher' do
    
    it '#receive(veichle) should raise an error' do
      allow_any_instance_of(d).to receive(:travel_allowed?).and_return(false)
      expect{subject.receive(vehicle)}.to raise_error
    end

    it '#release(veichle) should raise an error' do
      allow_any_instance_of(d).to receive(:travel_allowed?).and_return(false)
      expect{subject.release(vehicle)}.to raise_error
    end
  end 


  context 'When the airport is full and the weather good' do
    it '#receive raises an error' do
      allow_any_instance_of(Weather).to receive_messages(stormy?: false)
      Airport::DEFAULT_CAPACITY.times{subject.receive(vehicle)}
      expect{subject.receive(vehicle)}.to raise_error
    end
  end
end
