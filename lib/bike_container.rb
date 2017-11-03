
class BikeContainer

  DEFAULT_CAPACITY = 20;
  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = [];
    @capacity = capacity;
  end

  def add(bike)
    bikes.push(bike)
  end

  def remove_bike(bike)
    bikes.delete(bike)
  end


end
