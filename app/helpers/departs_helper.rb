module DepartsHelper
  def link_to_add_depart(form)
    form.fields_for :depart, Depart.new do |fr|
      render('empls/depart_form', fr: fr, i: 0)
    end
  #link_to(?#, class: 'btn btn-info',
   #     id: 'add_depart_link', data: {content: "#{fields}"}) do
   #   fa_icon("plus") + " Новый отдел"
   # end
  end
  def link_to_remove_depart(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_depart') do 
      fa_icon('times', title: 'Удалить отдел') + ' Удалить'      
    end
  end
end
