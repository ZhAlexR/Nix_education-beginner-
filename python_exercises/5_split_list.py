def split_list(list_to_split: list, split_numb: int) -> list:
    if split_numb > len(list_to_split):
        raise ValueError("The list length is less  than the specified number")
    elif len(list_to_split) == 0:
        raise ValueError("The list length is null")
    else:
        end_list = (list_to_split[i::split_numb] for i in range(split_numb))
        return list(end_list)


if __name__ == "__main__":
    print(split_list([1, 2, "a", "daa", 7], 3))
