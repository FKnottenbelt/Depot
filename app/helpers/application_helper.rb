module ApplicationHelper
  def render_if(render_condition, record)
    if render_condition
      render record
    end
  end
end
