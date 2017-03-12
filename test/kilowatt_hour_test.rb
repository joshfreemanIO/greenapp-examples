require 'test_helper'
require 'kilowatt_hour'

class KilowattHourTest < Minitest::Test
  def test_instantiates_with_a_value
    subject = KilowattHour.new(42.0)

    result = subject.value

    assert_equal(42.0, result)
  end

  def test_expects_numerical_value
    assert_raises KilowattHour::MustBeANumberError do
      KilowattHour.new('Non-numerical value')
    end
  end

  def test_value_must_be_positive
    assert_raises KilowattHour::MustBePositiveError do
      KilowattHour.new(-1)
    end
  end

  def test_two_kilowatt_hour_objects_are_equal
    assert_equal(KilowattHour.new(77.9), KilowattHour.new(77.9))
  end

  def test_two_kilowatt_hour_objects_are_not_equal
    refute_equal(KilowattHour.new(77.8), KilowattHour.new(77.9))
  end

  def test_a_kilowatt_hour_and_a_float_are_not_equal
    refute_equal(KilowattHour.new(77.0), 77.0)
  end
end
