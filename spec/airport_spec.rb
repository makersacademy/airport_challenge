require './lib/airport'

describe Airport do

  describe 'Landing' do

    it 'should allow a plane to land at an airport' do
      expect{subject.to respond.to(:land).with(1).argument}
    end

    it 'should raise an error when the weather is too stormy to land' do
      expect{(weather.stormy?).to be(true)}
      plane = Airplanes.new
      expect{(subject.land(plane)).to raise_error('weather too stormy to land')}
    end
  end


  describe 'take_off' do

    it 'should allow a plane to take-off' do
      expect{subject.to respond.to(:take_off).with(1).argument}
    end

  end

    it 'should raise an error when the weather is stormy' do
      expect{(weather.stormy?).to be(true)}
      plane = Airplanes.new
      subject.land(plane)
      expect{(subject.take_off(plane)).to raise_error('Weather too stormy for take-off')}
    end

  it 'should see which planes are in the airport' do
    expect{subject(:landed_planes).to eq []}
  end


end
