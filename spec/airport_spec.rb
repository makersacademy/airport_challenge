require 'airport'

describe Airport do

	let(:plane){double(:plane)}

	describe "#is_airport?" do
		it "returns true" do
			expect(subject.is_airport?).to be(true)
		end
	end

	describe "#initialize" do
		it "has a default capacity" do
			expect(subject.instance_variable_get(:@capacity)).to eq(Airport::DEFAULT_CAPACITY)
		end
	end

	describe "#accept_plane?(plane)" do
		it "returns true if empty" do
			expect(subject.accept_plane?(plane)).to be(true)
		end
	end

	describe "#receive_plane(plane)" do
		it "raise an error if full" do
			test_capacity = rand(1..100)
			planes = []
			airport = Airport.new(test_capacity)
			test_capacity.times { |i|
				planes[i] = double(:plane)
				airport.receive_plane(planes[i])
			}
			expect{airport.receive_plane(plane)}.to raise_error
		end
	end

	describe "#release_plane(plane)" do
		it "releases the plane" do
			subject.receive_plane(plane)
			expect(subject.release_plane(plane)).to eq(plane)
		end
	end

end

describe Sky do

  describe "#is_airport?" do
    it "responds to the message" do
      expect(subject).to respond_to(:is_airport?)
    end
    it "returns false" do
      expect(subject.is_airport?).to be(false)
    end
  end

  describe "#accept_plane?(plane)" do
    it "responds to the message" do
      expect(subject).to respond_to(:accept_plane?)
    end

    it "returns true" do
    	plane = double(:plane)
      expect(subject.accept_plane?(plane)).to be(true)
    end
  end

  describe "#receive_plane(plane)" do
    it "responds to the message" do
      expect(subject).to respond_to(:receive_plane)
    end
  end

  describe "#release_plane(plane)" do
    it "responds to the message" do
      expect(subject).to respond_to(:release_plane)
    end
  end

end
