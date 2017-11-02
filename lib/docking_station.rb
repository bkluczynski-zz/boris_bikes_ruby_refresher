require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20;

  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = [];
    @capacity = capacity;
  end

  def release_bike
    fail "Sorry, there are no bikes available for hire" if no_bikes_remaining?
    @bikes.pop
  end

  def dock(bike)
    fail "Sorry, there are no free slots to dock a bike" if station_full? @capacity
    @bikes.push(bike)
  end

    private

    def no_bikes_remaining?
      @bikes.empty?
    end

    def station_full? capacity
      @bikes.length == capacity
    end

end
