# frozen_string_literal: true

class PositionsController < ApplicationController
  before_action :set_stocks

  def create
    @user = current_user
    @portfolio = @user.portfolios.find(params[:portfolio_id])

    begin
      @position = Position.add_or_update_position(
        @portfolio.id,
        position_params[:stock_id],
        position_params[:quantity].to_i,
        position_params[:purchase_price],
        position_params[:purchase_date]
      )
      redirect_to @portfolio, notice: 'Position was successfully created.'
    rescue ActiveRecord::RecordInvalid => e
      @position = e.record
      render 'portfolios/show', status: :unprocessable_entity
    end
  end

  private

  def set_stocks
    @stocks = Stock.all
  end

  def position_params
    params.require(:position).permit(:quantity, :purchase_price, :purchase_date, :portfolio_id, :stock_id)
  end
end
