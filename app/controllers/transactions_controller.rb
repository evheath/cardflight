class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all.order(created_at: :desc)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
  end

  def destroy
    # do nothing
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.expect(transaction: [ :raw_message ])
    end
end
