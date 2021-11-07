str_list1 = ['dawd', 'random price', 'ada']
new_list = [x.upper() for x in str_list1 if 'price' in x]
print(new_list)


str_list2 = ['lene', 'price', 'what is your price?']
comprehension_list = [(x.upper() if 'price' in x else x) for x in str_list2]
print(comprehension_list)