module TagsHelper
  def tags_for_select
    Tag.all.collect{ |m| [m.id, m.name]}
  end
end
