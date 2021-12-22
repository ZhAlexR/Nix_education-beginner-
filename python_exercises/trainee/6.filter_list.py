# Дан список из словарей: list_ = [ {'name': 'Alex', 'age': 25}, {'name': 'Oleg', 'age': 23}, {'name': 'Anna',
# 'age': 32}, {'name': 'Igor', 'age': 50}, {'name': 'Anton', 'age': 17}, ] Отфильтруйте его так, чтобы в нём остались
# только люди, имена которых начинаются с буквы "А", и возраст между 18 и 30 годами включительно. В итоговом
# результате должен быть такой список: [{'name': 'Alex', 'age': 25}]
import re

list_ = [
    {'name': 'Alex', 'age': 25},
    {'name': 'Oleg', 'age': 23},
    {'name': 'Anna', 'age': 32},
    {'name': 'Igor', 'age': 50},
    {'name': 'Anton', 'age': 17},
]

# first method
filtered_list = [x for x in list_ if x.get('name').startswith("A") and 18 <= x.get('age') <= 30]
print(filtered_list)


# second method
def item_check(item):
    name = item.get("name")
    age = item.get("age")
    if re.match(r'^A', name) and (18 <= age <= 30):
        return True
    else:
        return False


print(list(filter(item_check, list_)))
