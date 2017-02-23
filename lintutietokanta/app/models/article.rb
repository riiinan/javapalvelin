class Article < ActiveRecord::Base
  has_many :users, dependent: :destroy
  validates :title, presence: true,
                   length: { minimum: 2 }

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
