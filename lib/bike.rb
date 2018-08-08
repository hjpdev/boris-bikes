class Bike
  attr_reader :condition

  def initialize
    @condition = true
  end

  def working?(condition=true)
    @condition = condition
    self
  end
end



