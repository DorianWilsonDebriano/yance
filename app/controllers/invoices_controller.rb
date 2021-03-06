class InvoicesController < ApplicationController
  def new
    @trainer = Trainer.find(params[:trainer_id])
    @invoice = Invoice.new
    authorize @invoice
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    @invoice.trainer = @trainer
    authorize @invoice
    if @invoice.save!
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(:rating, :content)
  end
end
