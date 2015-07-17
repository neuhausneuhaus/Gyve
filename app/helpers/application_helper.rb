module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, "javascript:document.location.replace('#{url_for(:sort => column, :direction => direction)}')", {:class => css_class}
  end

  def progress_calc(goal)
    donation_sum = goal.donations.inject(0) { |sum, d|sum + d.amount }
    percent_complete = ((donation_sum.to_f / goal.cost.to_f) *100.0).round(0)
    {progress: percent_complete, donation_sum: donation_sum}
  end
  
end
