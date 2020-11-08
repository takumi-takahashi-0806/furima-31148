class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options　presence: true do
          validates :nickname
          validates :birthday
          validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
          validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
          validates :kanafirst_name, format: { with: /\A[ァ-ヶー－]+\z/}
          validates :kanamiddle_name,format: { with: /\A[ァ-ヶー－]+\z/}
         end

         # パスワードは、半角英数字混合での入力が必須であること
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX 
        
         has_many :items
         has_many :buy_items
end
