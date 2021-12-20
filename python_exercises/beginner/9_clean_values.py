def clean_list(cleaning_out_list: list, removing_values: list) -> list:
    [cleaning_out_list.remove(value) for value in removing_values]
    return cleaning_out_list


if __name__ == '__main__':
    my_list = [1, 2, 3, 4, 5]
    clear_list = [1, 3]

    print(clean_list(my_list, clear_list))
