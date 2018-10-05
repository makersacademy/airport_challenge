require "airport"

describe Airport do
  describe 'land' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end
  end

  describe 'takeoff' do
    it 'responds to takeoff' do
      expect(subject).to respond_to :takeoff
    end
  end

  describe 'statuscheck' do
    it "responds to statuscheck" do
      expect(subject).to respond_to :statuscheck
    end
  end

  describe 'prevent_takeoff' do
    it "responds to prevent takeoff" do
      expect(subject).to respond_to :prevent_takeoff
    end
  end

  describe 'check_weather' do
    it "responds to check weather" do
      expect(subject).to respond_to :check_weather
    end
  end

  describe 'prevent_landing' do
    it "responds to prevent landing" do
      expect(subject).to respond_to :prevent_landing
    end
  end

  describe 'check_capacity' do
    it "responds to check capacity" do
      expect(subject).to respond_to :check_capacity
    end
  end

  describe 'set_capacity' do
    it "responds to set capacity" do
      expect(subject).to respond_to :set_capacity
    end
  end

end
