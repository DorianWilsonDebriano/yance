class ReviewsController < ApplicationController
  def new
    # @sportsclass = SportsClass.find(params[:sports_class_id])
    @trainer = Trainer.find(params[:trainer_id])
    @review = Review.new
    authorize @review
  end

  def create
    # @sportsclass = SportsClass.find(params[:sports_class_id])
    @trainer = Trainer.find(params[:trainer_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.trainer = @trainer
    authorize @review
    if @review.save!
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

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
