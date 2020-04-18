require 'plane'

describe Plane do
  
  it { is_expected.to respond_to(:land_at).with(1).argument }
  it { is_expected.to respond_to(:flying?) }
  it { is_expected.to respond_to(:depart) }
  it { is_expected.to respond_to(:port) }
  
  describe "#flying?" do
    it "returns a bool" do
      expect(subject.flying?).to be(true).or be(false)
    end
    
    context "when first created" do
      it "returns true" do
        expect(subject.flying?).to be true
      end
    end
  end
  
  describe "#land_at" do
    it "changes flying? to be false" do
      expect { subject.land_at(Airport.new) }
      .to change(subject, :flying?).to be false
    end
    
    it "gets added to airports list of planes when landing" do
      airport = Airport.new
      subject.land_at(airport)
      expect(airport.planes).to include(subject)
    end
    
    it "sets port to match airport that it landed at" do
      airport = Airport.new
      subject.land_at(airport)
      expect(subject.port).to eq(airport)
    end
    
    it "raises an error if it has already landed" do
      subject.land_at(Airport.new)
      expect { subject.land_at(Airport.new) }.to raise_error('This plane is already landed.')
    end
    
    it "raises an error when try to land at an airport that is full" do
      airport = Airport.new
      10.times { airport.dock(Plane.new) }
      expect { subject.land_at(airport) }.to raise_error('That airport is full.')
    end
  end
  
  describe "#depart" do
    it "changes flying? to be true" do
      subject.land_at(Airport.new)
      expect { subject.depart }
      .to change(subject, :flying?).to be true
    end
    
    it "gets removed from the list of planes at the airport" do
      airport = Airport.new
      subject.land_at(airport)
      subject.depart
      expect(airport.planes).to_not include(subject)
    end
    
    it "raises an error if already flying" do
      expect { subject.depart }.to raise_error('Plane is already airborne.')
    end
  end
end