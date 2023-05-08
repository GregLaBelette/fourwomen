# frozen_string_literal: true

# To be removed once models are created
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @email = current_user.email
  end
end
