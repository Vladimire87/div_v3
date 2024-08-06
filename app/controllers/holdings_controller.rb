# frozen_string_literal: true

class HoldingsController < ApplicationController
  before_action :set_stocks

  def show
    @user = current_user
    @portfolio = @user.portfolios.find(params[:portfolio_id])
    @transactions = @portfolio.transactions.where(stock_id: params[:stock_id])
  end

  def create
    @user = current_user
    @portfolio = @user.portfolios.find(params[:portfolio_id])
    @transaction = Transaction.new

    begin
      @holding = Holding.add_or_update_holding(
        @portfolio.id,
        holding_params[:stock_id],
        holding_params[:quantity].to_i,
        holding_params[:average_cost],
        holding_params[:purchase_date]
      )
      redirect_to @portfolio, notice: 'Holding was successfully created.'
    rescue ActiveRecord::RecordInvalid => e
      @holding = e.record
      render 'portfolios/show', status: :unprocessable_entity
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @holding = @portfolio.holdings.find(params[:id])
    render partial: 'operations', locals: { holding: @holding }
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @holding = @portfolio.holdings.find(params[:id])

    if @holding.update holding_params
      redirect_to portfolio_path(@portfolio)
    else
      render :show, status: :unprocessable_entity
    end

  end



  private

  def set_stocks
    @stocks = Stock.all
  end

  def holding_params
    params.require(:holding).permit(:quantity, :average_cost, :purchase_date, :portfolio_id, :stock_id)
  end
end
