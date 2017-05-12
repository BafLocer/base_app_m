module DepartsHelper
  def link_to_add_depart(form)
    new_object = Depart.new()
    fields = form.fields_for(:depart, new_object, 
      :child_index => 'new_depart') do |fr|
      render('empls/depart_form', fr: fr, i: 0)
    end
    #link_to(?#, class: 'btn btn-info', 
        #id: 'add_city_link', data: {content: "#{fields}"}) do 
      #fa_icon("plus") + " Новый город" 
    #end
  end
  def link_to_remove_depart(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_depart') do 
      fa_icon('times', title: 'Удалить город') + ' Удалить'      
    end
  end
end
