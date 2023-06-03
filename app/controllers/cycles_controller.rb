# frozen_string_literal: true

# To be removed once models are created
class CyclesController < ApplicationController
  before_action :authenticate_user!, :load_user

  def home
    next_period_start_at
    current_cycle_period_ended_at
    current_cycle_start
  end

  private

  def load_user
    @user = current_user
  end

  def next_period_start_at
    # replace by calculation
    @next_period_start_at ||= 21.days.from_now.beginning_of_day
  end

  def current_cycle_period_ended_at
    # replace by calculation
    @current_cycle_period_ended_at ||= 2.days.ago.beginning_of_day
  end

  def current_cycle_start
    # replace by calculation
    @current_cycle_start ||= 7.days.ago.beginning_of_day
  end
end
