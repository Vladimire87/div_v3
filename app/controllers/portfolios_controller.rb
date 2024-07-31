# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :set_user
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = @user.portfolios.new portfolio_params
    if @portfolio.save
      redirect_to root_path, notice: 'Portfolio Created'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_user
    @user = current_user
  end

  def portfolio_params
    params.require(:portfolio).permit(:name)
  end


end
