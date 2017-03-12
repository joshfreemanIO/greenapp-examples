class EnergyReport
  attr_reader :measured_monthly_kilowatt_hours, :modeled_monthly_kilowatt_hours

  def initialize(measured_monthly_kilowatt_hours:, modeled_monthly_kilowatt_hours:)
    @measured_monthly_kilowatt_hours = measured_monthly_kilowatt_hours
    @modeled_monthly_kilowatt_hours = modeled_monthly_kilowatt_hours
  end

  def percentage_difference
    (measured_monthly_kilowatt_hours.value - modeled_monthly_kilowatt_hours.value) / (measured_monthly_kilowatt_hours.value)
  end
end
