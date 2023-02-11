#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
    #[cfg(feature = "add-a-variant")]
    Debug,
}

pub fn log(level: LogLevel, message: &str) -> String {
    let level_str = match level {
        LogLevel::Info => "INFO",
        LogLevel::Warning => "WARNING",
        LogLevel::Error => "ERROR",
        #[cfg(feature = "add-a-variant")]
        LogLevel::Debug => "DEBUG",
    };

    return format!("[{}]: {}", level_str, message).to_string();
}

pub fn info(message: &str) -> String {
    return log(LogLevel::Info, message);
}

pub fn warn(message: &str) -> String {
    return log(LogLevel::Warning, message);
}

pub fn error(message: &str) -> String {
    return log(LogLevel::Error, message);
}
