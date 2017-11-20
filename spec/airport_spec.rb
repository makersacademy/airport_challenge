require 'airport'
require 'weather'

describe Airport do
  let(:flying_plane) { double :plane }
  let(:parked_plane) { double :plane }
  let(:stormy_weather) { double :weather }
  let(:sunny_weather) { double :weather }

  before(:each) do
    allow(flying_plane).to receive(:land).and_return(parked_plane)
    allow(parked_plane).to receive(:landed?).and_return(true)
    allow(parked_plane).to receive(:take_off).and_return(flying_plane)
    allow(flying_plane).to receive(:landed?).and_return(false)
    allow(stormy_weather).to receive(:stormy?).and_return(true)
    allow(sunny_weather).to receive(:stormy?).and_return(false)
  end

  context 'when landing of a plane' do
    it 'lands a plane' do
      subject.land(flying_plane, sunny_weather)
      expect(subject.planes).to include(parked_plane)
    end
    it 'does not allow a plane to land if the weather is stormy' do
      message = 'Landing denied due to stormy weather'
      expect { subject.land(flying_plane, stormy_weather) }
          .to raise_error message
    end
  end

  context 'in take-off procedure' do
    it 'gives the plane instructions to take off' do
      subject.land(flying_plane, sunny_weather)
      expect(subject.take_off(parked_plane, sunny_weather)).not_to be_landed
    end
    it 'does not allow a plane to take off if the weather is stormy' do
      message = 'Take-off denied due to stormy weather'
      subject.land(flying_plane, sunny_weather)
      expect { subject.take_off(parked_plane, stormy_weather) }
          .to raise_error message
    end
  end
end
