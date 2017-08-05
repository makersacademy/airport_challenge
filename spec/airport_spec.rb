require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double(:plane, :land => true, :take_off => true)}
  let(:weather) {double(:weather)}
  
  before do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  context '#land' do
    it {is_expected.to respond_to :land}
   
    it 'can land can land with a plane parameter' do
      expect{airport.land(plane)}.not_to raise_error
    end

    it 'confirms a plane has landed' do
      expect(airport.land(plane)).to eq "#{plane} has landed"
    end
    
    it 'raises an error if the weather is stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{airport.land(plane)}.to raise_error("You cannot land during stormy weather")
    end

	it "raises an error when airport is full" do
	  Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
	  expect{airport.land(plane)}.to raise_error "Airport is full"
	end

  end

  context '#take_off' do
  	it {is_expected.to respond_to :take_off}

    it 'can take off with a plane parameter' do
      airport.land(plane)
      expect{airport.take_off(plane)}.not_to raise_error
    end

    it 'confirms a plane has taken off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has taken off and left the airport"
    end

    it 'cannot take off during a storm' do
      airport.land(plane)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{airport.take_off(plane)}.to raise_error("You cannot take off during stormy weather")
    end

  end  
	
end

