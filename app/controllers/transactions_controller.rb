class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :set_category

  def index
    @transactions = @category.transactions
  end

  def show; end

  def new
    @transaction = @category.transactions.new
  end

  def create
    @transaction = @category.transactions.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to category_transactions_path(@category), notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_ids)
  end
end
