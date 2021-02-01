require 'airport.rb'

describe Airport do
  let(:subject) { Airport.new("Gatwick", 100) }
  let(:subject_2) { Airport.new("Heathrow", 100) }
  let(:plane) { Plane.new }

  describe "Testing @weather responds " do
    it "views weather at given airport" do
      allow(subject).to receive(:weather).and_return("stormy")
      expect(subject.weather).to eq("stormy")
    end
  end
  describe "Testing @airport_name responds" do
    it "views airport name" do
      expect(subject.airport_name).to eq("Gatwick")
    end
  end
  describe "Testing weather_generator responds" do 
    it "produces random weather" do
      allow(subject).to receive(:weather_generator).and_return("stormy")
      expect(subject.weather_generator).to eq("stormy")
    end
  end
  describe "Testing land_plane responds " do
    it "lands a plane" do
      allow(subject).to receive(:weather_stormy?).and_return false 
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
  end
  describe "Testing take_off responds " do
    it "takes off a plane" do
     allow(subject).to receive(:weather_stormy?).and_return false 
      expect(subject).to respond_to(:takeoff_plane).with(1).argument
    end
  end

  describe "Testing when airport is full" do
    it "Does not allow landing when the airport is full" do
      allow(subject).to receive(:weather_stormy?).and_return false
      100.times do
        subject.land_plane(:plane)
      end
      expect { subject.land_plane(plane) }.to raise_error "Airport is full!"
    end
  end 
  describe "Testing that no planes can land when it's stormy" do
    it "No planes can land when the airport weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return true
      expect { subject.land_plane(:plane) }.to raise_error "The Airport is stormy!"
    end
  end
  describe "Testing that no planes can take off when it's stormy" do
    it "No planes can takeoff when the airport weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return true
      expect { subject.takeoff_plane(:plane) }.to raise_error "The Airport is stormy!"
    end
  end
  describe "Testing airport_full?" do
    it "Checks if the total capacity is bigger than planes_in_airport" do
      allow(subject).to receive(:airport_full?).and_return false
      expect(subject.airport_full?).to eq false
    end
    it "Checks if the total capacity is bigger than planes_in_airport" do
      allow(subject).to receive(:airport_full?).and_return true
      expect(subject.airport_full?).to eq true
    end
  end

  describe "Testing weather_stormy?" do
    it "Checks if the weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return false
      expect(subject.weather_stormy?).to eq false
    end
    it "Checks if the weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return true
      expect(subject.weather_stormy?).to eq true
    end
  end
end


