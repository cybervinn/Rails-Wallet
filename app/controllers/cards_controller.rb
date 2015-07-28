class CardsController < ApplicationController

  def index
   if params[:user_id].present?
      @user = User.find params[:user_id]
      @cards = @user.cards
      @header =  @user.fname + "'s Cards"
    else
      @cards = Card.all
      @header = "All Cards"
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.users << current_user

    if @card.valid?
      @card.save!
      redirect_to cards_path
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def expired
    @cards = Card.expired
    render :index
  end


  private

  def card_params
    params.require(:card).permit(:number,
                                 :expiration_month,
                                 :expiration_year)
  end

end
