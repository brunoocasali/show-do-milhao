module ApplicationHelper
  def cms_scope?
    params[:cms_scope].eql? true
  end
end
