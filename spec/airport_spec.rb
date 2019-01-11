require 'airport'

describe Airport do

  let(:flying_plane) { double(:state => "flying", :is_grounded => "grounded") }
  let(:grounded_plane) { double(:state => "grounded", :is_flying => "flying") }
  let(:test_plane) { double(:state => nil, :is_flying => nil, :is_grounded => nil) }
  let(:stormy_weather) { double(:condition => "stormy") }
  let(:clear_weather) { double(:condition => "clear") }

  describe "Landing" do

    it "can land a plane and add it to an array of planes if the weather is clear" do
      expect(subject.land_plane(flying_plane, clear_weather).planes).to eq [flying_plane]
    end

    it "won't allow a plane to land if the weather is stormy" do
      expect { subject.land_plane(flying_plane, stormy_weather) }.to raise_error "can't do that due to storms"
    end

    it "won't allow a plane to land if the airport is full" do
      expect { subject.capacity.times { subject.land_plane(flying_plane, clear_weather) } }.to_not raise_error
      expect { subject.land_plane(flying_plane, clear_weather) }.to raise_error "can't land as airport is full"
    end

    it "won't allow an already grounded plane to land in an airport" do
      expect { subject.land_plane(grounded_plane, clear_weather) }.to raise_error "this plane is already grounded"
    end

  end

  describe "Taking Off" do

    it "can remove a plane from the airport when a plane takes off when the weather is clear" do
      airport = subject.land_plane(test_plane, clear_weather)
      expect(airport.take_off_plane(test_plane, clear_weather).planes.include?(test_plane)).to eq false
    end

    it "won't allow a plane to take off if the weather is stormy" do
      airport = subject.land_plane(test_plane, clear_weather)
      expect { airport.take_off_plane(test_plane, stormy_weather) }.to raise_error "can't do that due to storms"
    end

  end

  describe "Capacity" do

    it "allows a user to amend the default airport capacity when initializing a new airport" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end

  end

end
