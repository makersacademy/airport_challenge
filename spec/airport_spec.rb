require 'spec_helper'
require 'airport'

describe Airport do

  let(:plane) {double :plane}

  describe '#add_plane' do

    it {is_expected.to respond_to(:add_plane)}

    # it {is_expected.to respond_to()}

    it 'confirms a plane is in the airport after it lands' do
      subject.add_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it 'wont allow a plane to land if weather is too stormy' do
      subject.weather_is_stormy
      expect { raise subject.add_plane(plane)}.to raise_error 'weather is too stormy for landing'
    end

  end

  describe '#remove_plane' do

    it 'confirms a plane is not in the airport after take off' do
      subject.add_plane(plane)
      subject.remove_plane(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'wont remove a plane if weather is stormy' do
      subject.add_plane(plane)
      subject.weather_is_stormy
      expect { raise subject.remove_plane(plane)}.to raise_error 'weather is too stormy for take off'
    end

  end

  describe '#planes' do

    it {is_expected.to respond_to(:planes)}

  end

end
