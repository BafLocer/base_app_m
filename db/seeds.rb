if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
p1 = Depart.find_or_create_by(d_name: "Информатика")
p2 = Depart.find_or_create_by(d_name: "Биология")
p3 = Depart.find_or_create_by(d_name: "Физика")

c1 = Empl.find_or_create_by(last_name: "Морозенкова", first_name: "Алена", second_name: "Сергеевна", birthday: "01-12-1995", passport: "1876543256", inn: "1765843", post: "студентка", depart: p1)
c2 = Empl.find_or_create_by(last_name: "Брюханова", first_name: "Анна", second_name: "Константиновна", birthday: "20-12-1996", passport: "1876233256", inn: "1235843", post: "студентка", depart: p2)
c3 = Empl.find_or_create_by(last_name: "Фролов", first_name: "Данила", second_name: "Александрович", birthday: "20-01-1996", passport: "1001003256", inn: "1005843", post: "студент", depart: p2)
c4 = Empl.find_or_create_by(last_name: "Хрекин", first_name: "Андрей", second_name: "Олегович", birthday: "20-10-1996", passport: "1001013256", inn: "1095843", post: "студент", depart: p1)

n1 = Project.find_or_create_by(p_name: "Курсовая", cost: 1874, time_start: "01-12-2017", time_finish: "02-12-2017")
n2 = Project.find_or_create_by(p_name: "Дипломная работа", cost: 18740, time_start: "01-12-2017", time_finish: "02-12-2020")
