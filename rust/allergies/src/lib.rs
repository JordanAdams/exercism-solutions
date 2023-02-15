use enum_iterator::{all, Sequence};
use int_enum::IntEnum;

pub struct Allergies(Vec<Allergen>);

#[repr(u32)]
#[derive(Debug, Clone, Copy, PartialEq, PartialOrd, Eq, IntEnum, Sequence)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

fn sorted<T: PartialOrd + Sequence>() -> Vec<T> {
    let mut values = all::<T>().collect::<Vec<_>>();
    values.sort_by(|a, b| a.partial_cmp(&b).unwrap());
    values
}

fn allergies_from_score(score: u32) -> Vec<Allergen> {
    let mut allergies = sorted::<Allergen>();
    allergies.reverse();

    for allergen in allergies {
        if allergen.int_value() <= score {
            let mut result = vec![allergen];
            result.extend(allergies_from_score(score - allergen.int_value()));
            result.dedup();
            return result;
        }
    }

    return vec![];
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        return Allergies(allergies_from_score(score));
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        let Allergies(allergies) = self;
        return allergies.contains(allergen);
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        let Allergies(allergies) = self;
        return allergies.to_vec();
    }
}
