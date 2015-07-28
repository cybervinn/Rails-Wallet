class Admin::CardsController < ApplicationController

  before_action :verify_admin

  def index
    @cards = Card.all
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to admin_cards_path
  end

  private

  def verify_admin
    redirect_to root_path unless current_admin
  end

end
