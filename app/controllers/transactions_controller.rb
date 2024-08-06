class TransactionsController < ApplicationController
  before_action :set_portfolio

  def new
    @transaction = @portfolio.transactions.new
    @stocks = Stock.all
  end

  def show
    @transactions = @portfolio.transactions.where(stock_id: params[:id])
  end


  def create
    @transaction = @portfolio.transactions.new(transaction_params)
    @transaction.user = current_user

    if @transaction.save
      redirect_to portfolio_path(@portfolio), notice: 'Transaction was successfully created.'
    else
      @stocks = Stock.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_portfolio
    @portfolio = current_user.portfolios.find(params[:portfolio_id])
  end

  def transaction_params
    params.require(:transaction).permit(:date, :shares, :price_per_share, :stock_id)
  end
end
