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

  end

  describe '#remove_plane' do

    it 'confirms a plane is not in the airport after take off' do
      subject.add_plane(plane)
      subject.remove_plane(plane)
      expect(subject.planes).not_to include(plane)
    end

  end

  describe '#grounded_planes' do

    it {is_expected.to respond_to(:planes)}


  end

end
