# frozen_string_literal: true

# This handles some cusdtom date operations
module CycleDateHelper
  TODAY = "aujourd'hui"
  TOMORROW = 'demain'
  YESTERDAY = 'hier'
  SINCE_TODAY = "depuis aujourd'hui"
  SINCE_YESTERDAY = 'depuis hier'

  def from_now_or_ago_in_words(date)
    lapse = days_to(date)

    return ago(date) if lapse.negative?
    return TODAY if lapse.floor.zero?
    return TOMORROW if lapse.floor == 1

    "dans #{lapse.floor} jours"
  end

  def since_when(date)
    lapse = days_to(date)
    return SINCE_TODAY if lapse.floor.zero?
    return SINCE_YESTERDAY if lapse.floor == -1

    "depuis #{lapse.floor.abs} jours"
  end

  def days_to(date)
    (date - today).seconds.in_days
  end

  def ago(date)
    lapse = days_to(date)
    return YESTERDAY if lapse.floor == -1

    "il y a #{lapse.floor.abs} jours"
  end

  def today
    @today ||= Time.now.beginning_of_day
  end
end
