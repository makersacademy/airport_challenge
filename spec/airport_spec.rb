require 'airport'

describe Airport do

	let(:plane) {double(:plane)}
	let(:airport) {Airport.new}

  context '#land' do
    it {is_expected.to respond_to :land}
   
    it 'can land can land with a plane parameter' do
    	expect{airport.land(plane)}.not_to raise_error
    end

    it 'confirms a plane has landed' do
    	expect(airport.land(plane)).to eq "#{plane} has landed"
    end
    
    # it 'raises an error if the weather is stormy' do
    # 	expect{stormy.land(plane)}.to raise_error("You cannot land during stormy weather")
    # end

  it "raises an error when airport is full" do
    Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error "Airport is full"
  end


  end

  context '#take_off' do
  	it {is_expected.to respond_to :take_off}

    it 'can take off with a plane parameter' do
    	expect{airport.take_off(plane)}.not_to raise_error
    end

     it 'confirms a plane has taken off' do
    	expect(airport.take_off(plane)).to eq "#{plane} has taken off and left the airport"
    end

    it 'test' do
    	expect(1).to eq 1
    end

  end  
	
end

