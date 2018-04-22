class Weather

  def stormy?
    outlook == :stormy
  end

private

POTENTIAL = [:sunny, :sunny, :sunny, :sunny, :stormy]

def outlook
POTENTIAL.sample
end

end
