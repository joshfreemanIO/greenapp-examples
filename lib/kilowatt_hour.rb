class KilowattHour
  class MustBeANumberError < StandardError
  end

  class MustBePositiveError < StandardError
  end

  attr_reader :value

  def initialize(value)
    @value = value

    raise MustBeANumberError unless value.is_a? Numeric
    raise MustBePositiveError if value < 0
  end

  def ==(object)
    object.is_a?(KilowattHour) && self.value == object.value
  end
end
