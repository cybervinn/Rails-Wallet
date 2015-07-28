class User < ActiveRecord::Base

  validates_presence_of :fname, :lname, :email, :password

  validates_uniqueness_of :email

  validates_confirmation_of :password

  validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/

  validates_numericality_of :balance, { greater_than_or_equal_to: 0 }

  has_many :user_cards
  has_many :cards, through: :user_cards

  before_destroy :destroy_solely_owned_cards

  def destroy_solely_owned_cards
    all_my_cards = self.cards
    owned_cards = all_my_cards.select do |card|
                    card.users.length == 1
                  end
    owned_cards.each &:destroy!
  end


  def full_name
    fname + ' ' + lname
  end
end
