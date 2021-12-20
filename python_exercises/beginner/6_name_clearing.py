names = "Денис, Олег, Вася, Петя,Дима,Женя"
split_names_list = names.split(",")
clear_names_list = [name.strip(" ,") for name in split_names_list]
print(clear_names_list)
