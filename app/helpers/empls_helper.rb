module EmplsHelper
  def empl_options()
    Empl.all.pluck('id')
  end
  def project_options()
    Project.all.collect{|p| [p.p_name, p.id]}
  end
end
