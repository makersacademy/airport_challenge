require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land).with(2).arguments }
  
  describe '#land' do 
    let(:weather) { double :weather }
    let(:airport) { double :airport }

    it 'expects #land to return an array' do
      allow(weather).to receive(:set_weather).and_return(true)
      expect(subject.land(Airport.new, weather)).to be_an_instance_of(Array)
    end

    it 'responds with the final value of the array referring to the plane just landed' do
      airport = Airport.new
      allow(weather).to receive(:set_weather).and_return(true)
      subject.land(airport, weather)
      expect(airport.plane_array[-1]).to eq subject
    end

    it 'expects the plane to not land when the weather is stormy' do
      allow(weather).to receive(:set_weather).and_return(false)
      expect { subject.land(airport, weather) }.to raise_error 'Sorry - poor weather'
    end

    it 'expects the plane to not land when the airport is to capacity' do
      airport = Airport.new(30)
      allow(weather).to receive(:set_weather).and_return(true)
      30.times { Plane.new.land(airport, weather) }

      expect { subject.land(airport, weather) }.to raise_error 'Sorry - full capacity'
    end

    it "expects the plane not to land if it's already landed" do
      allow(weather).to receive(:set_weather).and_return(true)
      airport = Airport.new
      subject.land(airport, weather)
      expect { subject.land(airport, weather) }.to raise_error 'Sorry - this plane has already landed'
    end

  end

end
