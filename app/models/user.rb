class User < ApplicationRecord
  has_and_belongs_to_many :flights

  # self join relation combination, must have optional true
  has_many :nominees, class_name: 'User', foreign_key: 'nominator_id'
  belongs_to :nominator, class_name: 'User', optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
