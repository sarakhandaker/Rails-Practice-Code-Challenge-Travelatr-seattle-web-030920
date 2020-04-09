class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

def feature_post
    self.posts.max_by{|post| post.likes}
end

def five_recent
    self.posts.sort_by{|post| -(post.id)}
end

def average_age
    age_sum=0
    self.bloggers.uniq.each{|blogger|age_sum+=blogger.age}
    (age_sum/self.bloggers.count).to_f.round(2)
end

end