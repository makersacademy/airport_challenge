require 'airport'

describe Airport do

  subject {Airport.new(3)}

  it {is_expected.to respond_to(:arrival)}

  it {is_expected.to respond_to(:departure)}

  describe 'in good weather forecast' do

    before(:each) do
      @test_plane = double("plane")
      @other_airport = Airport.new
      allow(@test_plane).to receive(:land).with(subject) {"Landed in: #{subject}"}
      allow(@test_plane).to receive(:take_off).with(@other_airport) {"Departed to: #{@other_airport}"}
      allow(Weather).to receive(:good_forecast?).and_return(true)
      subject.arrival(@test_plane)
    end

    it 'lets a plane take off' do
      expect(subject.departure(@other_airport)).to eq "Departed to: #{@other_airport}"
    end

    it 'lets a plane land' do
      new_plane = double("plane")
      allow(new_plane).to receive(:land).with(subject) {"Landed in: #{subject}"}
      expect(subject.arrival(new_plane)).to eq "Landed in: #{subject}"
    end

    it 'tries to accpet a plane to a full airport' do
      other_test_plane = double("plane")

      allow(other_test_plane).to receive(:land).with(subject) #{"Landed in: #{subject}"}

      expect{3.times{subject.arrival(other_test_plane)}}.to raise_error("Airport full!")
    end
  end

  describe 'in bad weather forecast' do

    before(:each) do
      @test_plane = double("plane")
      @other_airport = Airport.new
      allow(Weather).to receive(:good_forecast?).and_return(false)
    end

    it 'doesn\'t let planes take off' do
      expect{subject.departure(@other_airport)}.to raise_error("Can't take off during stormy weather")
    end

    it 'doesn\'t let a plane land' do
      new_plane = double("plane")
      expect{subject.arrival(new_plane)}.to raise_error("Can't land during stormy weather")
    end

  end
end