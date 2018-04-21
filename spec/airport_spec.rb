require 'airport'

describe Airport do
  let(:plane) { instance_double("Plane") }


  describe '#stormy?' do
    it "returns a boolean" do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end

    it 'randomly generates weather' do
      srand(10)
      weather_arr = []
      100.times { weather_arr << subject.stormy? }
      expect(weather_arr).to include(true, false)
    end
  end

  describe '#land_plane' do

    it 'allows a plane to land' do
      subject.receive_plane(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#release_plane' do

    it 'allows a plane to take off' do
      subject.receive_plane(plane)
      subject.release_plane(plane)
      expect(subject.planes).not_to include plane
    end
  end


end
