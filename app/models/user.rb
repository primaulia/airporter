class User < ApplicationRecord
  has_and_belongs_to_many :flights

  # self join relation combination, must have optional true
  has_many :nominees, class_name: 'User', foreign_key: 'nominator_id'
  belongs_to :nominator, class_name: 'User', optional: true

  has_many :active_followings, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_followings, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followings, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
