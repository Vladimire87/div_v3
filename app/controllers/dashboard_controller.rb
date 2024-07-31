# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :set_user
  def index
    ensure_portfolio
  end

  private

  def set_user
    @user = current_user
  end

  def ensure_portfolio
    redirect_to new_portfolio_path if @user.portfolios.blank?
  end
end
