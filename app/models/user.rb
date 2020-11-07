class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # ニックネームが必須であること
         validates :nickname, presence: true

         # パスワードは、半角英数字混合での入力が必須であること
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX 

         #全角（漢字・ひらがな・カタカナ）での入力が必須であること
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
          validates :first_name
          validates :last_name
        end
         
         #全角（カタカナ）での入力が必須であること
        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
          validates :kanafirst_name
          validates :kanamiddle_name
        end

        #生年月日が必須であること
         validates :birthday, presence: true

         has_many :items
         has_many :buy_items
end
