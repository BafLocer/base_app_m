module ProjectsHelper
  def link_to_add_project(form)
    new_object = Project.new()
    fields = form.fields_for(:project, new_object, 
      :child_index => 'new_project') do |fr|
      render('empls/project_form', fr: fr, i: 0)
    end
    #link_to(?#, class: 'btn btn-info', 
        #id: 'add_city_link', data: {content: "#{fields}"}) do 
      #fa_icon("plus") + " Новый город" 
    #end
  end
  def link_to_remove_project(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_project') do 
      fa_icon('times', title: 'Удалить') + ' Удалить'      
    end
  end
end
