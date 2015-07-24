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

    it "reise an error when it's empty" do
      plane=Plane.new
      allow(subject).to receive(:check_the_weather) { true }
      expect {subject.release_plane plane}.to raise_error "\n\n*****   Airport is empty   *****\n\n".upcase
    end

    it 'release a plane if sunny' do
      plane = Plane.new
      allow(subject).to receive(:check_the_weather) { true }
      subject.landing(plane)
      expect(subject.release_plane(plane)) == plane
    end

    # it "raise a error if it's stormy" do
    #   plane = Plane.new
    #   allow(subject).to receive(:check_the_weather) { true }
    #   subject.landing(plane)
    #   allow(subject).to receive(:check_the_weather) {false}
    #   expect { subject.release_plane plane}.to raise_error "\n\n*****   WARNING!! It's stormy, plane is not authorized to take off  *****\n\n".upcase
    # end



  describe 'landing'

    it {is_expected.to respond_to :landing}

    it 'raises an error when full' do
      plane =Plane.new
      allow(subject).to receive(:check_the_weather) { true }
      subject.capacity.times { subject.landing plane }
      expect { subject.landing plane }.to raise_error "\n\n*****   Airport is full   *****\n\n".upcase
    end

    #  it "raises an error when it's stormy" do
    #   plane = Plane.new
    #   allow(subject).to receive(:check_the_weather) { false }
    #   expect { subject.landing plane }.to raise_error "\n\n*****   WARNING!! It's stormy, plane is not authorized to landing  *****\n\n".upcase
    # end

    it "a plane cal land if it's sunny" do
      plane =Plane.new
      allow(subject).to receive(:check_the_weather) { true }
      expect(subject.landing plane) == plane
    end



end
