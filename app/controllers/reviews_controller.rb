class ReviewsController < ApplicationController
  def new
    @trainer = Trainer.find(params[:trainer_id])
    @review = Review.new
    authorize @review
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @review = Review.new(review_params)
    #@review.trainer = @trainer.... has to be edited
    @review.user = current_user
    if review.save
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
    authorize @review
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
