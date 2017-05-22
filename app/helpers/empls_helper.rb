module EmplsHelper
  def empl_options()
    Empl.all.pluck('id')
  end
  def depart_for_select
    Depart.all.collect {|p| [p.d_name, p.id]}
  end
  
end
