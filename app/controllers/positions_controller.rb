class PositionsController < ApplicationController

  def create
    @user = current_user
    @portfolio = @user.portfolios.find params[:portfolio_id]
    @position = @portfolio.positions.new position_params

    if @position.save!
      redirect_to @portfolio, notice: 'Position was successfully created.'

    else
      render 'portfolios/show', status: :unprocessable_entity
    end
  end

  private

  def position_params
    params.require(:position).permit(:quantity, :purchase_price, :purchase_date, :portfolio_id, :stock_id)
  end


end
