require 'airport'

describe Airport do

	let(:plane) {plane = Plane.new}
	let(:airport) {Airport.new}

  context '#land' do
    it {is_expected.to respond_to :land}
   
    it 'can land can land with a plane parameter' do
    	expect{airport.land(plane)}.not_to raise_error
    end

    it 'confirms a plane has landed' do
    	expect(airport.land(plane)).to eq "#{plane} has landed"
    end
  end

  context '#take_off' do
  	it {is_expected.to respond_to :take_off}

  end  
	
end