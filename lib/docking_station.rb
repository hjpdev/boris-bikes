require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise('No bikes in station.') if empty?
    @bikes.last.working?
    @bikes.pop
  end

  def dock(bike)
    raise('Dock full.') if full?
    @bikes << bike.working?(false)
  end

  private

  def full?
    @bikes.length == capacity
  end

  def empty?
    @bikes.empty?
  end
end


