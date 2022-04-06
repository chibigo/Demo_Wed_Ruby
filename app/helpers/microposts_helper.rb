module MicropostsHelper
    def micropost_count(comment)
        count = comment.count();
        return "(#{count})" if count > 0
    end
end
