class ResultsController < ProjectBaseController

  def index
    @status = Hash[current_project.section_statuses.map{|s| [s.section.id, s]}]
    @replies = Hash[current_project.replies.map{|r| [r.prompt.id, r]}]
  end

end