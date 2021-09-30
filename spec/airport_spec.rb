require 'airport'

describe Airport do
  it { is_expected.to respond_to :airport_management }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :flying? }

  describe '#airport_management' do
    it 'should return the number of planes at the airport' do
    expect(subject.airport_management).to eq("Planes at the airport: 0")
    end

    it 'should return the number of planes at the airport' do
      subject.land
      subject.land
      subject.take_off
      expect(subject.airport_management).to eq("Planes at the airport: 1")
      end
  end
  
  describe '#land' do
    it 'should return a flying status' do
      subject.land
      expect(subject.flying?).to eq false
    end

    it 'should add 1 to the current capacity' do
      subject.land
      expect(subject.airport_management).to eq("Planes at the airport: 1")
    end

    it 'should instruct the plane to land' do
      expect(subject.land).to eq("Land the plane at the airport.")
    end

    it 'should stop the plane from landing if at capacity' do
      subject.land
      subject.land
      subject.land
      subject.land
      subject.land
      expect(subject.land).to eq("The plane cannot land. Airport is at capacity.")
    end
  end

  describe '#flying?' do
    it 'should return false if the plane has landed' do
      subject.land
      expect(subject.flying?).to eq false
    end

    it 'should return true if the plane has taken off/flying' do
      subject.land
      subject.take_off
      expect(subject.flying?).to eq true
    end
  end

  describe '#take_off' do
    it 'should return a flying status' do
      subject.land
      subject.take_off
      expect(subject.flying?).to eq true
    end

    it "should return a take off message if there are no planes at the airport" do
      expect(subject.take_off).to eq "There are no planes to take off."
    end

    it 'should subtract 1 from the current capacity' do
      subject.land
      subject.land
      subject.take_off
      expect(subject.airport_management).to eq("Planes at the airport: 1")
    end

    it 'should confirm the plane is no longer at the airport.' do
      subject.land
      expect(subject.take_off).to eq("Plane has left the airport.")
    end
  end
end