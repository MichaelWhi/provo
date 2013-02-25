module TagsHelper
  def tag_cloud(tags, classes)
    # tags = tags.load if tags.respond_to?(:load)

    return [] if tags.empty?

    max_count = tags.sort_by(&:count).last.count.to_f

    tags.each do |tag|
      index = ((tag.count / max_count) * (classes.size - 1))
      yield tag, classes[index.nan? ? 0 : index.round]
    end
  end
  
  def project_tags(db_limit = 30)
    all_tags(Project, db_limit)
  end
  
  def project_tags_count
    Project.tag_counts_on(:tags).count
  end
  
  def idea_tags(db_limit = 30)
    all_tags(Idea, db_limit)
  end
  
  def idea_tags_count
    Idea.tag_counts_on(:tags).count
  end
  
  def all_tags(klass, db_limit)
    klass.all_tag_counts.order("tags_count desc").limit(db_limit) 
  end
end
