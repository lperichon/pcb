# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def months
    (1..12).collect {|i| [t('date.month_names')[i], i]}
  end
end
