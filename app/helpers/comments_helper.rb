module CommentsHelper
    def reply_comment(reply)
        return reply.parent.user.name
    end
end
