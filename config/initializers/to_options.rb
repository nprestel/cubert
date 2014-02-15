module ActiveRecord
  class Base
    def self.to_options(title=:name)
      self.all.map{|r| [r.send(title), r.id]}
    end
  end
end