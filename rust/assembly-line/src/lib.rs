pub fn production_rate_per_hour(speed: u8) -> f64 {
    let success_rate = match speed {
        _ if speed < 5 => 1.0,
        _ if speed < 9 => 0.9,
        _              => 0.77,
    };

    return 221. * (speed as f64) * success_rate;
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    return (production_rate_per_hour(speed) as u32) / 60;
}
