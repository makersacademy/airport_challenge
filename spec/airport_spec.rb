require 'airport'

describe Airport do
  let(:vehicle) { double :vehicle }


  context 'In any context' do
    it {is_expected.to respond_to(:receive).with(1).argument }

    it {is_expected.to respond_to(:parked?).with(1).argument }

    it '#parked? should return false for a plane that is not in the airport' do
      expect(subject.parked?(vehicle)).to eq false
    end
  end


  context 'When travel is allowed by dispatcher' do

    it '#receive(veichle) should not raise an error' do
      allow_any_instance_of(Dispatcher).to receive(:travel_allowed?).and_return(true)
      expect{subject.receive(vehicle)}.not_to raise_error
    end

    it '#parked? should return true after a plane is landed' do
      allow_any_instance_of(Dispatcher).to receive(:travel_allowed?).and_return(true)
      subject.receive(vehicle)
      expect(subject.parked?(vehicle)).to eq true
    end
  end 


  context 'When travel is not allowed by dispatcher' do
    
    it '#receive(veichle) should raise an error' do
      allow_any_instance_of(Dispatcher).to receive(:travel_allowed?).and_return(false)
      expect{subject.receive(vehicle)}.to raise_error('Travel not allowed at this time')
    end

    it '#release(veichle) should raise an error' do
      allow_any_instance_of(Dispatcher).to receive(:travel_allowed?).and_return(false)
      expect{subject.release(vehicle)}.to raise_error('Travel not allowed at this time')
    end
  end 
end
