class Plane

  attr_reader :is_flying

  @is_flying = false

  def landed?(hanger = true)
    hanger ? @is_flying = false : @is_flying = true
  end
end