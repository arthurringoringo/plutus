# frozen_string_literal: true

class PlansController < ApplicationController
  def show
    @estimation_plan = current_user.plans.where(year: params[:year], plan_type: :estimation).index_by(&:month)
    @actual_plan = current_user.plans.where(year: params[:year], plan_type: :actual).index_by(&:month)
    current_month = Date.current.month
    current_year = params[:year]
    @current_month_plans = current_user.plans.where(month: current_month, year: current_year).index_by(&:plan_type).with_indifferent_access
    p @current_month_plans
    render :show
  end



end
