require 'airport'

describe Airport do
  let(:vehicle) { double :vehicle }


  context 'In any context' do
    it {is_expected.to respond_to(:receive).with(1).argument }
  end


  context 'When travel is allowed by dispatcher' do

    it '#receive(veichle) should not raise an error' do
      expect{subject.receive(vehicle)}.not_to raise_error
    end
  end 


  context 'When travel is not allowed by dispatcher' do
    
    it '#receive(veichle) should raise an error' do
      allow_any_instance_of(Dispatcher).to receive(:travel_allowed?).and_return(false)
      expect{subject.receive(double :vehicle)}.to raise_error('Travel not allowed at this time')
    end
  end 

end
