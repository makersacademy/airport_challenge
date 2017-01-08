class Airport
  attr_reader :airport_name, :full
  alias_method :full?, :full


  def initialize(name)
    @airport_name = name
  end

end
