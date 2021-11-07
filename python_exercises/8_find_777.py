import random
import string


def get_random_string(length):
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str


if __name__ == "__main__":

    random_list = []
    while len(random_list) < 1000:
        random_list.append(random.randint(1, 10000))
        random_list.append(get_random_string(10))

    search_list = random.sample(random_list, len(random_list))
    
    counter = 0
    for elem in search_list:
    	if elem == 777:
    		print (f"The 777 was found in list, the index is {search_list.index(elem)}")
    		break

    	elif counter >= 100:
    		print ("100 elements were checked")
    		break
    	else:
    		counter += 1
