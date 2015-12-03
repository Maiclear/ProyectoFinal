class User < ActiveRecord::Base
  before_save :default_role

  has_many :ongs

  has_many :comments
  has_many :ong_comments, through: :comments, source: :commentable, source_type: 'Ong'
  has_many :event_comments, through: :comments, source: :commentable, source_type: 'Event'


  has_many :participations
  has_many :events, through: :participations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence:true, uniqueness: true
  validates :lastname, presence:true
  validates :rut, presence:true, uniqueness: true
  validates :address, presence:true



  enum role: [:admin, :ong, :basic, :guest]

  def default_role
    self.role ||= 2
  end

  def to_s
    "#{self.name} #{self.last_name}"
  end



end

