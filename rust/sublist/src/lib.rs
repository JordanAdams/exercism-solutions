use std::fmt::Debug;

#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

fn starts_with<T: PartialEq>(list: &[T], start: &[T]) -> bool {
    return list[0..(start.len())].eq(start);
}

fn contains_sublist<T: PartialEq>(outer: &[T], inner: &[T]) -> bool {
    if outer.len() < inner.len() {
        return false;
    }

    if starts_with(outer, inner) {
        return true;
    }

    return contains_sublist(&outer[1..], inner);
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list.eq(_second_list) {
        return Comparison::Equal;
    }

    if _first_list.len() == 0 {
        return Comparison::Sublist;
    }

    if _second_list.len() == 0 {
        return Comparison::Superlist;
    }

    if contains_sublist(_first_list, _second_list) {
        return Comparison::Superlist;
    }

    if contains_sublist(_second_list, _first_list) {
        return Comparison::Sublist;
    }

    return Comparison::Unequal;
}
