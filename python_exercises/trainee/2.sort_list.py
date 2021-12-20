# Дан список из словарей в формате [{'name': 'Oleg', 'age': 23}, {'name': 'Vasya', 'age': 19}]
# Отсортируйте список по возрасту людей, чтобы получилось [{'name': 'Vasya', 'age': 19}, {'name': 'Oleg', 'age': 23}]
# Используйте sorted и lambda
from operator import attrgetter

dict_list = [{'name': 'Oleg', 'age': 23}, {'name': 'Vasya', 'age': 19}]

sorted_list = sorted(dict_list, key=lambda sort_dict: sort_dict.get("age"))
print(sorted_list)
