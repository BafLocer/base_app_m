module EmplsHelper
  def link_to_add_empl(form)
    new_object = Empl.new()
    fields = form.fields_for(:empl, new_object, 
      :child_index => 'new_empl') do |fr|
      render('projects/empl_form', fr: fr, i: 0)
    end
    #link_to(?#, class: 'btn btn-info', 
        #id: 'add_city_link', data: {content: "#{fields}"}) do 
      #fa_icon("plus") + " Новый город" 
    #end
  end
  def link_to_remove_empl(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_empl') do 
      fa_icon('times', title: 'Удалить проект') + ' Удалить'      
    end
  end
end
