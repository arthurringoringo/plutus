# frozen_string_literal: true

class PlansController < ApplicationController
  def show
    @plans = current_user.plans
    render :show
  end

end
