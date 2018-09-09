require 'airport.rb'

describe Airport do

  it {is_expected.to respond_to :planes_arr}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to :capacity}

  it "has a default capacity attribute that can be overriden" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(40)
      40.times { airport.land Plane.new }
      expect{ airport.land Plane.new }.to raise_error 'Airport is full'
    end
  end

  describe 'initialization' do
    it 'defaults capacity' do
      airport = Airport.new(Airport::DEFAULT_CAPACITY)
      Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
      expect{ airport.land Plane.new }.to raise_error 'Airport is full'
    end
  end

  # describe 'initialization' do
  #   subject { Airport.new }
  #   let(:plane) { Plane.new }
  #     it 'defaults capacity' do
  #       described_class::DEFAULT_CAPACITY.times do
  #         subject.land(plane)
  #       end
  #       expect{ subject.land(plane) }.to raise_error 'Airport is full'
  #     end
  #   end

  describe "#land" do
    it "instructs a plane to land at airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes_arr).to include(plane)
    end

    it 'raises an error when the plane is already landed' do
      plane = Plane.new
      subject.land(plane)
      plane.report_landed
      expect(plane.landed).to eq(true)
      expect { subject.land plane }.to raise_error 'The plane is already landed'
    end

    it 'raises an error when the airport is full' do
      subject.land(Plane.new)
      subject.capacity.times{ subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end

    it 'raises an error when weather is stormy' do
      weather = Weather.new
      weather.random = "stormy"
      expect{subject.land(Plane.new)}.to raise_error "Can't land because weather is stormy"
    end
  end

  describe '#take_off' do

    it 'raises an error when there are no planes in the airport' do
      expect(subject.planes_arr).to include([])
      #expect(subject.planes_arr).to be_nil
      expect{subject.take_off}.to raise_error 'no planes available'
    end

    it 'raises an error when weather is stormy' do
      weather = Weather.new
      expect(weather.random).to include("stormy")
      expect{subject.take_off}.to raise_error 'Can not take off weather is stormy'
    end

    it 'raises an error when the plane has already taken off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(plane.is_flying).to eq(true)
      expect { subject.take_off plane }.to raise_error "Can't take off already flying"
    end

    it 'raises an error when the plane is not in this airport' do
      plane = Plane.new
      expect(subject.planes_arr).not_to include(plane)
      expect(subject.planes_arr).not_to be_empty?
      expect { subject.take_off plane }.to raise_error "Can't take off, plane is not in this airport"
    end

  end

  describe "#take_off" do
    it "instructs a plane to take off from the airport and confirm" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    # it "confirms that the plane has taken off" do
    #   plane = Plane.new
    #   subject.land(plane)
    #   expect(subject.take_off).to eq(plane)
    #   expect(plane.confirm?).to eq(true)
    # end
  end


end
