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
    raise('No working bikes available') if @bikes.all? { |b| b.condition == false }
    first_working_index = @bikes.index { |b| b.condition }
    @bikes.delete_at(first_working_index)
  end

  def dock(bike, condition=true)
    raise('Dock full.') if full?
    bike.condition = condition
    @bikes << bike
  end

  private

  def full?
    @bikes.length == capacity
  end

  def empty?
    @bikes.empty?
  end
end