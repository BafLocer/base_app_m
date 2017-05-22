module EmplsHelper
  def empl_options()
    Empl.all.pluck('id')
  end
  
end
