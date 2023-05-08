# frozen_string_literal: true

# To be removed once models are created
class CyclesController < ApplicationController
  TODAY = "aujourd'hui"
  TOMORROW = 'demain'
  YESTERDAY = 'hier'

  before_action :authenticate_user!, :load_user

  include ActionView::Helpers::DateHelper

  def home
    @overdue = overdue?
    @from_now = from_now
    @period_happening = period_happening
  end

  private

  def load_user
    @user = current_user
  end

  def overdue?
    distance_from_period = next_period_date - today

    distance_from_period.negative?
  end

  def today
    @today ||= Time.now.beginning_of_day
  end

  def from_now
    distance_from_period = next_period_date - today

    return ago if distance_from_period.negative?
    return TODAY if (next_period_date - today).zero?
    return TOMORROW if next_period_date - today == 1.day

    "dans #{distance_of_time_in_words(today, next_period_date)}"
  end

  def ago
    return YESTERDAY if today - next_period_date < 1.day

    "il y a #{time_ago_in_words(next_period_date)}"
  end

  def next_period_date
    # replace by calculation
    @next_period_date ||= 1.days.from_now.beginning_of_day
  end

  def period_happening
    # replace by calculation
    true
  end
end
