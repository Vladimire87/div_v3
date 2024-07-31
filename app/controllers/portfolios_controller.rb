# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :set_user
  before_action :set_portfolio, only: %i[show]
  def new
    @portfolio = Portfolio.new
  end

  def show; end

  def create
    @portfolio = @user.portfolios.new portfolio_params
    if @portfolio.save
      redirect_to portfolio_path(@portfolio), notice: 'Portfolio Created'
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

  def set_portfolio
    @portfolio = @user.portfolios.find(params[:id])
  end


end
