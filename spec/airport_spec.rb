require 'airport'

describe Airport do

  describe 'landing planes' do
    it 'instructs a plane to land at the airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'holds a plane in the airport when it lands' do
      new_plane = double('plane')
      subject.land(new_plane)
      expect(subject.planes_landed).to include(new_plane)
    end
  end

  describe 'taking off planes' do
    it 'instructs a plane to take off from the airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'removes plane from airport once instructed to take off (assuming good weather)' do
      new_plane = double('plane')
      subject.land(new_plane)
      allow(subject.weather).to receive(:stormy_currently?).and_return false
      subject.take_off(new_plane)
      expect(subject.planes_landed).not_to include(new_plane)
    end
  end

  describe 'safe take off and landing during bad weather' do

    it 'prevents planes taking off when weather is stormy' do
      new_plane = double('plane')
      subject.land(new_plane)
      allow(subject.weather).to receive(:stormy_currently?).and_return true
      expect { subject.take_off(new_plane) }.to raise_error 'cannot take off when stormy'
    end

    it 'prevents planes landing when weather is stormy' do
      new_plane = double('plane')
      allow(subject.weather).to receive(:stormy_currently?).and_return true
      expect { subject.land(new_plane) }.to raise_error 'cannot land when stormy'
    end

  end
end
