class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts
validates :name, presence: true
validates :name, uniqueness: true
validates :age, numericality: {greater_than: 0}
validates :bio, length: { minimum: 30 }

def likes_num
    num=0
    self.posts.each{|post| num+=post.likes}
    num
end
def feature_post
    self.posts.max_by{|post| post.likes}
end

def top_five
    hash={}
    self.destinations.each do |des|
        if hash[des.name]
     hash[des.name]+=1
        else 
            hash[des.name]=1
        end
    end
    hash=hash.sort_by{|des, num| -num}
end

end
