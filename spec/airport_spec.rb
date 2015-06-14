require 'airport'
require 'plane'

describe Airport do

   it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to :check_the_weather}


  describe 'instruct_plane'

   it {is_expected.to respond_to :instruct_plane}


  describe 'release_plane'

    it {is_expected.to respond_to :release_plane}

    it 'release a plane if sunny' do
    plane = Plane.new
    allow(subject).to receive(:check_the_weather) { true }
    subject.landing(plane)
    expect(subject.release_plane(plane)) == plane
  end



  describe 'landing'

    it {is_expected.to respond_to :landing}

    it 'raises an error when full' do
      plane =Plane.new
      allow(subject).to receive(:check_the_weather) { true }
      subject.capacity.times { subject.landing plane }
      expect { subject.landing plane }.to raise_error "\n\n*****   Airport is full   *****\n\n".upcase
    end



end
