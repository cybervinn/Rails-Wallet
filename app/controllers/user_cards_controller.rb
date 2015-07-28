class UserCardsController < ApplicationController
  def create
    user = User.find user_card_params[:user_id]
    UserCard.create user_card_params
    redirect_to user_cards_path(user)
  end

  private

  def user_card_params
    params.require(:user_card).permit(:user_id, :card_id)
  end
end
