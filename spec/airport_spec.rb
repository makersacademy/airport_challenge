require 'airport'

describe Airport do
  let(:plane) { double :plane }

  context "0. initial set-up" do
    it "a. initial airport capacity can be overriden" do
      new_capacity = Airport.new(30)
      expect(new_capacity.capacity).to eq 30
    end
  end
  #======================================================
  context "1. test landing function" do
    it "a. let a plane land at the airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "b. prevent a plane from landing in stormy weather" do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "Caution! It's stormy!"
    end

    it "c.(when not stormy) confirm the plane is landed in the airport " do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return false
      expect(subject.land(plane)).to include(plane)
    end

    it "d.(when not stormy) prevent a plane from landing when aiport is full" do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return false
      allow_any_instance_of(Airport).to receive(:full?).and_return true
      expect { subject.land(plane) }.to raise_error "Caution! Airport is full!"
    end

    it "e.(when not stormy) prevent a plane from landing when it's previously landed " do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return false
      allow_any_instance_of(Airport).to receive(:full?).and_return false
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "The same plane already landed"
    end
  end
#======================================================
  context "2. test taking-off function" do
    it "a. let a plane take off from the airport" do
      expect(subject).to respond_to(:departure).with(1).argument
    end

    it "a. prevent a plane from taking off in stormy weather" do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return true
      expect { subject.departure(plane) }.to raise_error "Caution! It's stormy!"
    end

    it "c. (when not stormy), confirm the plane is no longer in the airport " do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.departure(plane)).not_to include(plane)
    end

    it "d. (when not stormy), the plane cannot take off unless previously landed " do
      allow_any_instance_of(Airport).to receive(:stormy?).and_return false
      expect { subject.departure(plane) }.to raise_error "The plane is not landed, so can't take off"
    end
  end

end
