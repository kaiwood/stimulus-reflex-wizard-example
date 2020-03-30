class Post < ApplicationRecord
  def self.persistant(id, values = {})
    Rails.cache.write("title:#{id}", values["title"]) if values["title"]
    Rails.cache.write("body:#{id}", values["body"]) if values["body"]

    new(
      title: Rails.cache.read("title:#{id}"),
      body: Rails.cache.read("body:#{id}")
    )
  end
end
