class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'は全角(漢字・ひらがな・カタカナ)で入力してください'} do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ , message: 'はカタカナで入力してください'} do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birth_day
  end

  has_many :items
  has_many :trading_histories
end
