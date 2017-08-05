require 'plane'

describe Plane do
  
  context '#land' do

    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'will not land if already grounded' do
    	allow_any_instance_of(Plane).to receive(:flying).and_return(false)
    	expect{subject.land}.to raise_error "Plane is already grounded"
    end

  end


  context '#take_off' do

  	it 'responds to take_off' do
  		expect(subject).to respond_to :take_off
  	end

  	it 'will not take off if already airbourne' do
  		allow_any_instance_of(Plane).to receive(:flying).and_return(true)
    	expect{subject.take_off}.to raise_error "Plane is already in the air"
    end

  end

end