require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double(:plane, :grounded? => false, :grounded= => true)}
  let(:plane2) { double(:plane2, :grounded? => false, :grounded= => true)}
  let(:plane3) { double(:plane3, :grounded? => false, :grounded= => true)}
  let(:plane4) { double(:plane4, :grounded? => false, :grounded= => true)}
  let(:plane5) { double(:plane5, :grounded? => false, :grounded= => true)}

  it 'Plane can land at the airport' do
    expect(subject).to respond_to(:land_plane)
  end  


  context 'Sunny weather conditions' do
    

    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    end

    it 'Landed plane gets stored at the airport' do
      new_airport = Airport.new
      new_airport.land_plane(plane)
      expect(new_airport.planes).to eql([plane])
    end
  
    it 'plane to take off from an airport and confirm that it is no longer in the airport' do
      subject.land_plane(plane)
      allow(plane).to receive(:grounded?).and_return(true)
      expect(subject.take_off(plane)).to eql('Plane left the airport')
      expect(subject.planes).to eq([])
    end 

    it 'plane unable to land when airport capacity is full' do
      10.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'Airport at full capacity'
    end

    it 'Plane unable to take off if already in the air' do
      airport = Airport.new
      expect { airport.take_off(plane) }.to raise_error 'This plane is already in the air'
    end

    it 'Plane unable to land if it is already grounded' do
      subject.land_plane(plane)
      allow(plane).to receive(:grounded?).and_return(true)
      expect { subject.land_plane(plane) }.to raise_error 'The plane is in the airport already'
    end

    it 'The same plane cannot take off a second time without landing prior to the next take off' do
      subject.land_plane(plane)
      allow(plane).to receive(:grounded?).and_return(true)
      subject.take_off(plane)
      allow(plane).to receive(:grounded?).and_return(false)
      expect { subject.take_off(plane) }.to raise_error 'This plane is already in the air'
    end

    it '5 defined planes landed into the airport Plane1, Plane2 and Plane4 to take_off in favourable weather conditions. To return Plane3 and Plane 5 in the airport' do
      subject.land_plane(plane)
      subject.land_plane(plane2)
      subject.land_plane(plane3)
      subject.land_plane(plane4)
      subject.land_plane(plane5)
      expect(subject.planes).to eq([plane, plane2, plane3, plane4, plane5])
      allow(plane).to receive(:grounded?).and_return(true)
      allow(plane2).to receive(:grounded?).and_return(true)
      allow(plane4).to receive(:grounded?).and_return(true)
      subject.take_off(plane)
      subject.take_off(plane2)
      subject.take_off(plane4)
      expect(subject.planes).to eq([plane3, plane5])
    end

    it 'cannot land a plane in one airport and take off from another' do
      heathrow = Airport.new
      gatwick = Airport.new
      heathrow.land_plane(plane)
      allow(plane).to receive(:grounded?).and_return(true)
      expect { gatwick.take_off(plane) }.to raise_error 'That plane is not in this airport'
    end

    it 'Cannot take of due to stormy weather' do
      subject.land_plane(plane)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
      allow(plane).to receive(:grounded?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Weather conditions are not favourable for taking off'
    end

    it 'Airport to take argument of 5 and return capacity of 5' do
      airport = Airport.new(5)
      land_5_planes = 5.times{airport.land_plane(plane)}
      expect{airport.land_plane(plane)}.to raise_error 'Airport at full capacity'
    end    
  end



  context 'weather conditions are stormy' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
    end

    it 'cannot land due to stormy weather' do
      expect { subject.land_plane(plane) }.to raise_error 'Weather conditions are not favourable for landing'
    end

  end

end
