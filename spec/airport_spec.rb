require "airport.rb"

describe Airport do

  it "responds to ::DEFAULT_CAPACITY" do
    expect(Airport).to be_const_defined(:DEFAULT_CAPACITY)
  end

  subject(:airport) { Airport.new("Paris") }

  describe ".new" do
    it "takes an argument" do
      expect{airport}.not_to raise_error
    end
    it "saves argument to @airport_name" do
      expect(airport.airport_name).to eq "Paris"
    end
    it "saves false to @full?" do
      expect(airport.full?).to eq false
    end
  end

  describe "Instance of Airport" do

    describe ".airport_name" do
      it { is_expected.to respond_to(:airport_name) }
    end

    describe ".full?" do
      it { is_expected.to respond_to(:full?) }
    end

    # describe ".accept_landing?" do
    #   context "default airport capacity" do
    #     context "airport is full" do
    #       it "will not accept more planes" do
    #         allow(airport).to receive(:full?) { true }
    #         expect(airport.accept_landing(plane)).to
    #       end
    #     end
    #   end
    # end
    context "docking planes" do


      describe ".dock" do
        it { is_expected. to respond_to(:dock).with(1).argument }
      end
    end


  end




end
