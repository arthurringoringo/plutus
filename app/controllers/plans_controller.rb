# frozen_string_literal: true

class PlansController < ApplicationController

  def create
    @plan = current_user.plans.create!(year: params[:year], month: params[:month], plan_type: params[:plan_type])
    redirect_to plans_path(year: params[:year])
  end

  def index
    @estimation_plan = current_user.plans.where(year: params[:year], plan_type: :estimation).index_by(&:month)
    @actual_plan = current_user.plans.where(year: params[:year], plan_type: :actual).index_by(&:month)
    current_month = Date.current.month
    current_year = params[:year]
    @current_month_plans = current_user.plans.where(month: current_month, year: current_year).index_by(&:plan_type).with_indifferent_access
    render :index
  end

  def show
    @plan = current_user.plans.find(params[:id])
    render :show
  end



end
