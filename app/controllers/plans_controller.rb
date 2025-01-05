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


  def add_income
    @plan = current_user.plans.find(params[:id])
    @plan.incomes.create!(amount: params[:income][:amount], name: params[:income][:name], user_id: current_user.id)
    redirect_to plan_path(id: @plan.id)
  end

  def delete_income
    income = current_user.incomes.find(params[:id])
    @plan = income.plan
    income.destroy
    redirect_to plan_path(id: @plan.id)
  end

  def add_expense
    @plan = current_user.plans.find(params[:id])
    @plan.expenses.create!(amount: params[:expense][:amount], name: params[:expense][:name], user_id: current_user.id, is_debt_payment: params[:expense][:is_debt_payment])
    redirect_to plan_path(id: @plan.id)
  end

  def delete_expense
    expense = current_user.expenses.find(params[:id])
    @plan = expense.plan
    expense.destroy
    redirect_to plan_path(id: @plan.id)
  end



end
