require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  describe '#land method' do

    it "gives us a message when the method is called" do
      airport = Airport.new
      expect(airport.land).to eq true
    end

  end

end
