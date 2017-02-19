require 'airport'
include DefaultCapacity

describe Airport do

  describe '#land_plane' do
    it 'confirms plane has landed' do
      allow(subject).to receive(:available_plane?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      plane = subject.land_plane
      expect(subject.land_plane).to eq plane
    end

    it 'raises an error when trying to land when airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      DefaultCapacity::MEDIUM.times { subject.land_plane }
      expect { subject.land_plane }.to raise_error 'Airport full'
    end

  # cannot work out how to test for a puts statement output.
  # use something like capybara?

    # it 'tests to see whether the correct landing information is displayed after land command' do
    #   allow(subject).to receive(:stormy?).and_return(false)
    #   subject.land_plane
    #   #allow(subject).to receive(:puts).and_return('There is currently 1 plane that has landed.')
    #   expect(subject.land_plane).to eq('There is currently 1 plane that has landed.')
    # end
    #   it 'tests to see whether the correct landing information is displayed after land command' do
    #
    #   5.times { subject.land_plane }
    #   #allow(subject).to receive(:puts).and_return('There is currently 1 plane that has landed.')
    #   #expect(subject.land_plane).to output ('There is currently 1 plane that has landed.')
    #   specify { expect { subject.land_plane }.to output('foo').to_stdout }
    # end

    it 'raises an error when trying to land plane in stormy weather' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land_plane }.to raise_error 'Stormy weather preventing landing'
    end
  end

  describe '#confirm_landed?' do
    it 'confirms the correct plane has landed at airport' do
      plane = Plane.new
      allow(subject).to receive(:available_plane?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane
      expect(subject.confirm_landed?).to eq true
    end
  end


  describe '#take_off', :focus => true do
    it 'confirm take off / confirm correct plane takes off' do
      plane = Plane.new
      allow(subject).to receive(:take_off).and_return(plane)
      allow(subject).to receive(:available_plane?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when trying to take off in stormy weather' do
      allow(subject).to receive(:available_plane?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error 'Stormy weather preventing take-off'
    end

    it 'raises an error when trying to take off when there are no planes that have landed' do
      allow(subject).to receive(:available_plane?).and_return(false)
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.take_off }.to raise_error 'No available planes'
    end
  end

  describe '#available_plane?' do
    it 'confirms if there is a plane available for take-off' do
      allow(subject).to receive(:landed_planes).and_return(1)
      expect(subject.available_plane?).to eq true
    end
  end

  describe '#weather_generator', :focus_weather => true do
    it 'random weather generates a stormy weather condition' do
      allow(subject).to receive(:weather_generator).and_return(3)
      expect(subject.weather_generator).to eq 3
    end
  end

  describe '#landed_planes' do
    it 'confirms correct amount still at airport after multiple landings/take-offs' do
      allow(subject).to receive(:stormy?).and_return(false)
      18.times { subject.land_plane }
      13.times { subject.take_off }
      expect(subject.landed_planes).to eq 5
    end
  end
end
