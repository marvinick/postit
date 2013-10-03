class Post < ActiveRecord::Base
include VoteableMarvSept

	BADWORDS = ['bad', 'words']
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  #has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validate :bad_words

  after_validation :generate_slug

  def bad_words
  	title.split(' ').each do |word|
  		if BADWORDS.include?(word)
  			errors.add(:title, "can't cont ain bad words")
  			break
  		end
  	end
  end

  #def total_votes
  #  self.votes.where(vote: true).size - self.votes.where(vote: false).size
  #end

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end

end
