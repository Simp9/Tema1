class Comment < ActiveRecord::Base
  belongs_to :article, :foreign_key => :article_id
  belongs_to :user
end
