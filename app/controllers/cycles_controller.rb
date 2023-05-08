# frozen_string_literal: true

# To be removed once models are created
class CyclesController < ApplicationController
  before_action :authenticate_user!, :current_user_email

  def home
  end

  private

  def current_user_email
    @email = current_user.email
  end
end
