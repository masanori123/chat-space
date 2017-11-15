module ApplicationHelper
  def group_message
    @groups = current_user.groups
    @groups.each do |group|
      if group.messages.present?
        if group.messages.last.body.present?
         return group.messages.last.body
        else
          return "画像が投稿されています"
        end
      else
       return "まだメッセージはありません"
      end
    end
  end
end
